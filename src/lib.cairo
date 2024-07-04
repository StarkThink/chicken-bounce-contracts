mod store;

mod utils {
    mod maps;
    mod random;
    mod cell;
}

mod systems {
    mod game_system;
}

mod models {
    mod board;
    mod game;
    mod leader_board;
    mod leader_board_players;
    mod tile;
    mod events;
}


#[cfg(test)]
mod tests {
    mod create_game;
    mod setup;
    mod play;
}

