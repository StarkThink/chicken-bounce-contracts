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
    // use chicken_bounce::models::events::{GameOver, GameWin, CreateGame, GameEvent, Move};
    use chicken_bounce::models::tile::Tile;
    use chicken_bounce::store::{Store, StoreTrait};
    use starknet::{ContractAddress, get_caller_address, get_contract_address};

    #[abi(embed_v0)]
    impl GameImpl of IGameSystem<ContractState> {
        fn create_game(world: @IWorldDispatcher, player_name: felt252) -> u32 {
            let game_id = world.uuid() + 1;
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
    }
}
