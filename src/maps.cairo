enum Cell {
    StickE, // -> /
    StickW, // => \
    Empty,
    ChickenIn,
    ChickenOut,
    Border,
    Corner
}

fn grids(round_number:u8, map_number: u8) -> Array<Cell> {
    let round1_map1 =
        array![
            Cell::Corner, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::StickE, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round1_map2 =
        array![
            Cell:Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickE, Cell:Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenOut,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell:StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Corner
        ];

    let round1_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::ChickenOut, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round2_map1 =
        array![
            Cell::Corner, Cell::Border, Cell:: Border, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::StickW, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round2_map2 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round2_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell:Empty, Cell::StickW, Cell::StickE, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::Border, Cell:Empty, Cell:Empty, Cell:Empty, Cell::StickE, Cell:Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round3_map1 = 
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::StickE, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell:Corner
        ];

    let round3_map2 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::ChickenIn, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Corner
        ];

    let round3_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::StickE, Cell::StickE, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickW, Cell::ChickenOut,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round4_map1 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::StickW, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::ChickenOut, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round4_map2 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::StickW, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::ChickenOut, Cell::Corner,
        ];

    let round4_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Corner, Cell::ChickenOut, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round5_map1 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenOut,
            Cell::Border, Cell::StickE, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round5_map2 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickE,Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::ChickenOut,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round5_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::ChickenOut, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickW, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty,   Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::StickW, Cell::StickE, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::StickE, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round6_map1 = 
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickE, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::ChickenOut, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round6_map2 = (
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickE, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::ChickenIn, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::ChickenOut, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ]
    );

    let round6_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::Border, Cell::StickE, Cell::StickE, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::ChickenOut, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickW, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round7_map1 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::StickW, Cell::Border,
            Cell::ChickenOut, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];

    let round7_map2 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::ChickenOut,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Border,
            Cell::Border, Cell::StickW, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::StickE, Cell::StickE, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
        ];

    let round7_map3 =
        array![
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::ChickenOut, Cell::Corner,
            Cell::ChickenIn, Cell::StickW, Cell::StickE, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickW, Cell::Empty, Cell::Empty, Cell::Border, 
            Cell::Border, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Empty, Cell::StickE, Cell::Border, 
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
        ];
    
    match round_number {
        1 => {

        },
        1 => {
            match map_number {
                1 => round1_map1,
                2 => round1_map2,
                3 => round1_map3,
            }
        },
        2 => {
            match map_number {
                1 => round2_map1,
                2 => round2_map2,
                3 => round2_map3,
            }
        },
        3 => {
            match map_number {
                1 => round3_map1,
                2 => round3_map2,
                3 => round3_map3,
            }
        },
        4 => {
            match map_number {
                1 => round4_map1,
                2 => round4_map2,
                3 => round4_map3,
            }
        },
        5 => {
            match map_number {
                1 => round5_map1,
                2 => round5_map2,
                3 => round5_map3,
            }
        },
        6 => {
            match map_number {
                1 => round6_map1,
                2 => round6_map2,
                3 => round6_map3,
            }
        },
        7 => {
            match map_number {
                1 => round7_map1,
                2 => round7_map2,
                3 => round7_map3,
            }
        },
    }
}

fn get_random_map(world: IWorldDispatcher, round: u8) -> (Array<Cell>, u8, Array<u8>) {
    let mut randomizer = RandomImpl::new(world);
    let mut random_index = randomizer.between::<u8>(0, 2);

    let grid = grids(round, random_index);
    grid
}