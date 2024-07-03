#[derive(Clone, Copy, PartialEq, Drop, Display, Serde)]
enum Cell {
    StickE, // -> /
    StickW, // => \
    Empty,
    ChickenIn,
    ChickenOut,
    Border,
    Corner,
}
