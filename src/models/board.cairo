#[derive(Copy, Drop, Serde)]
#[dojo::model]
struct Board {
    #[key]
    game_id: u32,
    len_rows: u8,
    len_cols: u8,
    chicken_in_pos: u8,
    chicken_out_pos: u8,
}

#[generate_trait]
impl BoardImpl of BoardTrait {
    #[inline(always)]
    fn new(game_id: u32, len_rows: u8, len_cols: u8, chicken_in_pos: u8, chicken_out_pos: u8) -> Board {
        Board { game_id, len_rows, len_cols, chicken_in_pos, chicken_out_pos }
    }
}

