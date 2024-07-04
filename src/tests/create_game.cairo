mod create_game {
    use chicken_bounce::utils::cell::Cell;
    use chicken_bounce::store::{Store, StoreTrait};
    use chicken_bounce::systems::game_system::{
        game_system, IGameSystemDispatcher, IGameSystemDispatcherTrait,
    };

    use chicken_bounce::tests::setup::setup;
    #[test]
    #[available_gas(30000000000000000)]
    fn test_create_game() {
        let (world, systems) = setup::spawn_game();
        let mut store: Store = StoreTrait::new(world);

        let game_id = systems.game_system.create_game('Gerson');
        assert_eq!(game_id, 1);
        let game = store.get_game(game_id);
        assert_eq!(game.player_name, 'Gerson');
    }
}

