use chicken_bounce::utils::random::RandomImpl;
use dojo::world::{IWorld, IWorldDispatcher, IWorldDispatcherTrait};
use chicken_bounce::utils::cell::Cell;


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
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
            Cell::Border, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Empty, Cell::ChickenOut,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickW, Cell::Border,
            Cell::ChickenIn, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Border,
            Cell::Border, Cell::StickW, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Empty, Cell::Border,
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
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
            Cell::Border, Cell::Empty, Cell::StickW, Cell::StickE, Cell::Empty, Cell::Empty, Cell::ChickenIn,
            Cell::Border, Cell::Empty, Cell::Empty, Cell::Empty, Cell::StickE, Cell::Empty, Cell::Border,
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
            Cell::Corner, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Border, Cell::Corner
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
        0 => array![Cell::Empty],
        1 => {
            match map_number {
                0 => round1_map1,
                1 => round1_map2,
                2 => round1_map3,
                _ => array![Cell::Empty]
            }
        },
        2 => {
            match map_number {
                0 => round2_map1,
                1 => round2_map2,
                2 => round2_map3,
                _ => array![Cell::Empty]
            }
        },
        3 => {
            match map_number {
                0 => round3_map1,
                1 => round3_map2,
                2 => round3_map3,
                _ => array![Cell::Empty]
            }
        },
        4 => {
            match map_number {
                0 => round4_map1,
                1 => round4_map2,
                2 => round4_map3,
                _ => array![Cell::Empty]
            }
        },
        5 => {
            match map_number {
                0 => round5_map1,
                1 => round5_map2,
                2 => round5_map3,
                _ => array![Cell::Empty]
            }
        },
        6 => {
            match map_number {
                0 => round6_map1,
                1 => round6_map2,
                2 => round6_map3,
                _ => array![Cell::Empty]
            }
        },
        7 => {
            match map_number {
                0 => round7_map1,
                1 => round7_map2,
                2 => round7_map3,
                _ => array![Cell::Empty]
            }
        },
        _ => array![Cell::Empty]
    }
}

fn get_random_map(world: IWorldDispatcher, round_number: u8) -> Array<Cell> {
    let mut randomizer = RandomImpl::new(world);
    let mut random_index = randomizer.between::<u8>(0, 2);

    let grid = grids(round_number, random_index);
    grid
}

fn get_index_chicken_out(map: @Array<Cell>) -> u8 {
    let mut index = 0_u8;
    let chicken_out_index = loop {
        if index.into() == map.len() {
            break 0_u8;
        }
        let cell = *map.at(index.into());

        if cell == Cell::ChickenOut {
            break index;
        }
        index += 1;
    };
    chicken_out_index
}

fn get_index_chicken_in(map: @Array<Cell>) -> u8 {
    let mut index = 0_u8;
    let chicken_in_index = loop {
        if index.into() == map.len() {
            break 0_u8;
        }
        let cell = *map.at(index.into());

        if cell == Cell::ChickenIn {
            break index;
        }
        index += 1;
    };
    chicken_in_index
}

fn get_chicken_out_at(len_cols: u8, row: u8, col: u8) -> u8 {
    let index: u8 = ((row * len_cols) + col).into();
    index
}