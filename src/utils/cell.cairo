#[derive(Copy, Drop, Serde, PartialEq, Introspect)]
enum Cell {
    StickE, // -> /
    StickW, // => \
    Empty,
    ChickenIn,
    ChickenOut,
    Border,
    Corner,
}

impl CellIntoFelt252 of Into<Cell, felt252> {
    fn into(self: Cell) -> felt252 {
        match self {
            Cell::Empty => 'empty',
            Cell::StickE => 'stickE',
            Cell::StickW => 'stickW',
            Cell::ChickenIn => 'player',
            Cell::ChickenOut => 'target',
            Cell::Border => 'blank',
            Cell::Corner => 'corner',
        }
    }
}
