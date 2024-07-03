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
