use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct CreateGame {
    #[key]
    game_id: u32,
    player_address: ContractAddress
}

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct GameWin {
    #[key]
    game_id: u32,
    #[key]
    player_address: ContractAddress,
    round: u8,
    score: u32
}

#[derive(Model, Copy, Drop, Serde)]
#[dojo::event]
struct GameOver {
    #[key]
    game_id: u32,
    player_address: ContractAddress
}