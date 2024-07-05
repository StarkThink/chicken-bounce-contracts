mod play {
    use chicken_bounce::utils::cell::Cell;
    use chicken_bounce::store::{Store, StoreTrait};
    use chicken_bounce::systems::game_system::{
        game_system, IGameSystemDispatcher, IGameSystemDispatcherTrait,
    };
    use chicken_bounce::utils::maps::get_chicken_out_at;

    use chicken_bounce::tests::setup::setup;
    #[test]
    #[available_gas(30000000000000000)]
    fn test_play_lose() {
        let (world, systems) = setup::spawn_game();
        let mut store: Store = StoreTrait::new(world);

        let game_id = systems.game_system.create_game('Gerson');
        let board = store.get_board(game_id);
        let game = store.get_game(game_id);

        let index = get_chicken_out_at(board.len_cols, 1, 6);

        systems.game_system.play(game_id, 1, 6);
        let board2 = store.get_board(game_id);
        let game2 = store.get_game(game_id);

        assert_ne!(board2.chicken_out_pos, index);
        // assert_eq!(board.len_cols, 7);
        assert_eq!(game2.state, false);
    }

    #[test]
    #[available_gas(30000000000000000)]
    fn test_play_win() {
        let (world, systems) = setup::spawn_game();
        let mut store: Store = StoreTrait::new(world);

        let game_id = systems.game_system.create_game('Gerson');
        let board = store.get_board(game_id);

        let index = get_chicken_out_at(board.len_cols, 2, 6);

        assert_eq!(board.chicken_out_pos, index);
        assert_eq!(board.len_cols, 7);
    }
}

