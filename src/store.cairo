use starknet::ContractAddress;

use dojo::world::{IWorldDispatcher, IWorldDispatcherTrait};

use chicken_bounce::models::board::Board;
use chicken_bounce::models::game::Game;
use chicken_bounce::models::leader_board::LeaderBoard;
use chicken_bounce::models::leader_board_players::LeaderBoardPlayers;
use chicken_bounce::models::tile::Tile;

#[derive(Drop)]
struct Store {
    world: IWorldDispatcher
}

#[generate_trait]
impl StoreImpl of StoreTrait {
    #[inline(always)]
    fn new(world: IWorldDispatcher) -> Store {
        Store { world: world }
    }

    fn get_game(ref self: Store, id: u32) -> Game {
        get!(self.world, (id), (Game))
    }

    fn set_game(ref self: Store, game: Game) {
        set!(self.world, (game));
    }

    fn get_board(ref self: Store, game_id: u32) -> Board {
        get!(self.world, (game_id), (Board))
    }

    fn set_board(ref self: Store, board: Board) {
        set!(self.world, (board));
    }

    fn get_leader_board(ref self: Store, id: u32) -> LeaderBoard {
        get!(self.world, (id), (LeaderBoard))
    }

    fn set_leader_board(ref self: Store, leader_board: LeaderBoard) {
        set!(self.world, (leader_board));
    }

    fn get_leader_board_players(ref self: Store, id: u32) -> LeaderBoardPlayers {
        get!(self.world, (id), (LeaderBoardPlayers))
    }

    fn set_leader_board_players(ref self: Store, leader_board_players: LeaderBoardPlayers) {
        set!(self.world, (leader_board_players));
    }

    fn get_tile(ref self: Store, row_id: u32, col_id: u32, game_id: u32) -> Tile {
        get!(self.world, (row_id, col_id, game_id), (Tile))
    }

    fn set_tile(ref self: Store, tile: Tile) {
        set!(self.world, (tile));
    }
}
