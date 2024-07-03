#[derive(Clone, Copy, PartialEq, Drop, Display)]
enum Cell {
    StickE, // -> /
    StickW, // => \
    Empty,
    ChickenIn,
    ChickenOut,
    Border,
    Corner,
}