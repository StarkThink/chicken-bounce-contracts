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
}
