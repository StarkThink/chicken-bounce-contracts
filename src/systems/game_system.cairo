use dojo::world::{IWorld, IWorldDispatcher, IWorldDispatcherTrait};
use starknet::ContractAddress;

#[dojo::interface]
trait IGameSystem {
    fn create_game(ref world: IWorldDispatcher, player_name: felt252) -> u32;
    fn create_round(ref world: IWorldDispatcher, game_id: u32);
    fn play(ref world: IWorldDispatcher, game_id: u32, pos_x: u8, pos_y: u8);
    fn end_game(game_id: u32);
}

#[dojo::contract]
mod game_system {
    use super::IGameSystem;
    use chicken_bounce::models::game::{Game, GameTrait};
    use chicken_bounce::models::board::{Board, BoardTrait};
    use chicken_bounce::models::leader_board::{LeaderBoard, LeaderBoardTrait};
    use chicken_bounce::models::leader_board_players::{LeaderBoardPlayers, LeaderBoardPlayersTrait};
    use chicken_bounce::utils::cell::Cell;
    use chicken_bounce::utils::maps::{
        get_random_map, get_index_chicken_in, get_index_chicken_out, get_chicken_out_at
    };
    use chicken_bounce::models::events::{GameEvent, GameOver, GameWin, CreateGame};

    use chicken_bounce::models::tile::Tile;
    use chicken_bounce::store::{Store, StoreTrait};
    use starknet::{ContractAddress, get_caller_address, get_contract_address};

    #[abi(embed_v0)]
    impl GameImpl of IGameSystem<ContractState> {
        fn create_game(ref world: IWorldDispatcher, player_name: felt252) -> u32 {
            let mut store = StoreTrait::new(world);

            let game_id = world.uuid() + 1;
            let owner = get_caller_address();
            let map = get_random_map(world, 1);

            self.store_map(game_id, ref store, @map, 5, 5);

            let chicken_in = get_index_chicken_in(@map);
            let chicken_out = get_index_chicken_out(@map);

            let board = self.generate_board(game_id, 5, 5, chicken_in, chicken_out);

            let mut leader_board = store.get_leader_board(1);
            if leader_board.len_players == 0 {
                leader_board = self.generate_leaderboard();
            }

            let game = GameTrait::new(
                id: game_id, owner: owner, player_name: player_name, score: 0, round: 1, state: true
            );

            store.set_game(game);
            store.set_leader_board(leader_board);
            store.set_board(board);

            let CreateGameEvent = CreateGame { game_id: game_id, player_address: owner };
            emit!(world, (CreateGameEvent));

            game_id
        }

        fn create_round(ref world: IWorldDispatcher, game_id: u32) {
            let mut store: Store = StoreTrait::new(world);
            let mut game = store.get_game(game_id);

            game.round += 1;

            if game.round <= 7 {
                let gameEvent = GameEvent { id: game_id, score: game.score, round: game.round };
                emit!(world, (gameEvent));
            } else {
                let GameOverEvent = GameOver {
                    game_id: game_id, player_address: get_caller_address()
                };
                emit!(world, (GameOverEvent));
            }

            let map = get_random_map(world, game.round);
            let (rows, cols) = if game.round == 7 {
                (6, 6)
            } else {
                (5, 5)
            };

            self.store_map(game_id, ref store, @map, rows, cols);

            let chicken_in = get_index_chicken_in(@map);
            let chicken_out = get_index_chicken_out(@map);

            let board = self.generate_board(game_id, rows, cols, chicken_in, chicken_out);
            store.set_board(board);
            store.set_game(game);
        }

        fn end_game(ref world: IWorldDispatcher, game_id: u32) {
            self.end_game_proc(world, game_id);
        }

        fn play(ref world: IWorldDispatcher, game_id: u32, pos_x: u8, pos_y: u8) {
            let mut store = StoreTrait::new(world);

            let mut game = store.get_game(game_id);
            let mut board = store.get_board(game_id);

            assert(game.state, 'Game is not active');

            let index = get_chicken_out_at(board.len_cols, pos_x, pos_y);
            println!("INDEX: {}", index);

            if index == board.chicken_out_pos {
                game.score += 10;
                let GameWinEvent = GameWin {
                    game_id: game_id,
                    player_address: get_caller_address(),
                    round: game.round,
                    score: game.score
                };
                emit!(world, (GameWinEvent));
                store.set_game(game);
                ()
            } else {
                self.end_game_process(world, game_id);
                ()
            }
        }
    }

    #[generate_trait]
    impl InternalImpl of InternalTrait {
        fn store_map(
            self: @ContractState,
            game_id: u32,
            ref store: Store,
            map: @Array<Cell>,
            rows: u8,
            cols: u8
        ) {
            let mut x_index = 0;
            loop {
                if x_index == rows {
                    break;
                }
                let mut y_index = 0;
                loop {
                    if y_index == cols {
                        break;
                    }
                    let cell = *map.at((x_index * cols + y_index).into());
                    store
                        .set_tile(
                            Tile {
                                row_id: x_index.into(),
                                col_id: y_index.into(),
                                game_id: game_id,
                                value: cell
                            }
                        );
                    y_index += 1;
                };
                x_index += 1;
            };
        }

        fn generate_leaderboard(self: @ContractState) -> LeaderBoard {
            LeaderBoard { id: 1, len_players: 0 }
        }

        fn generate_board(
            self: @ContractState,
            game_id: u32,
            rows: u8,
            cols: u8,
            chicken_in_pos: u8,
            chicken_out_pos: u8,
        ) -> Board {
            Board {
                game_id: game_id,
                len_rows: rows,
                len_cols: cols,
                chicken_in_pos: chicken_in_pos,
                chicken_out_pos: chicken_out_pos
            }
        }

        fn end_game_process(self: @ContractState, world: IWorldDispatcher, game_id: u32) {
            let mut store: Store = StoreTrait::new(world);
            let mut game: Game = store.get_game(game_id);
            let mut leader_board: LeaderBoard = store.get_leader_board(1);

            let new_player: LeaderBoardPlayers = LeaderBoardPlayersTrait::new(
                leader_board.len_players, game.player_name, game.score
            );
            leader_board.len_players += 1;

            store.set_leader_board_players(new_player);
            store.set_leader_board(leader_board);
            store.set_game(game);

            let GameOverEvent = GameOver { game_id: game_id, player_address: get_caller_address() };
            emit!(world, (GameOverEvent));
        }
    }
}
