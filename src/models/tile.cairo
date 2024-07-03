use chicken_bounce::utils::cell::Cell;

#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Tile {
    #[key]
    row_id: u32,
    #[key]
    col_id: u32,
    #[key]
    game_id: u32,
    value: Cell
}

#[generate_trait]
impl TileImpl of TileTrait {
    #[inline(always)]
    fn new(row_id: u32, col_id: u32, game_id: u32, value: Cell) -> Tile {
        Tile { row_id, col_id, game_id, value }
    }
}
