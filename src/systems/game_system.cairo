use dojo::world::{IWorld, IWorldDispatcher, IWorldDispatcherTrait};
use starknet::ContractAddress;

#[dojo::interface]
trait IGameSystem {
    fn create_game(player_name: felt252) -> u32;
}


#[dojo::contract]
mod game_system {
    use super::IGameSystem;
    use chicken_bounce::models::game::{Game, GameTrait};
    use chicken_bounce::models::board::{Board, BoardTrait};
    use chicken_bounce::models::leader_board::{LeaderBoard, LeaderBoardTrait};
    use chicken_bounce::models::leader_board_players::{LeaderBoardPlayers, LeaderBoardPlayersTrait};
    use chicken_bounce::utils::cell::Cell;
    use chicken_bounce::utils::maps::{get_random_map, get_index_chicken_in, get_index_chicken_out};
    use chicken_bounce::models::events::{GameOver, GameWin, CreateGame};
    use chicken_bounce::models::tile::Tile;
    use chicken_bounce::store::{Store, StoreTrait};
    use starknet::{ContractAddress, get_caller_address, get_contract_address};

    #[abi(embed_v0)]
    impl GameImpl of IGameSystem<ContractState> {
        fn create_game(world: @IWorldDispatcher, player_name: felt252) -> u32 {
            let mut store = StoreTrait::new(world);

            let game_id = world.uuid() + 1;
            let owner = get_caller_address();

            let map = get_random_map(world, 1);
            // TODO: All the maps are 5x5 except in the last round. We have to change its sizes when the round is 7.
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
            self: @ContractState, game_id: u32, rows: u8, cols: u8, out_x_pos: u8, out_y_pos: u8,
        ) -> Board {
            Board {
                game_id: game_id,
                len_rows: rows,
                len_cols: cols,
                out_x_pos: out_x_pos,
                out_y_pos: out_y_pos
            }
        }
    }
}
