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
    fn test_play() {
        let (world, systems) = setup::spawn_game();
        let mut store: Store = StoreTrait::new(world);

        let game_id = systems.game_system.create_game('Gerson');
        let board = store.get_board(game_id);

        let index = get_chicken_out_at(board.len_cols, 0, 2);

        assert_eq!(board.chicken_out_pos, index);
    }
}

