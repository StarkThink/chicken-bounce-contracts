#[derive(Model, Copy, Drop, Serde)]
struct Board {
    #[key]
    game_id: u32,
    len_rows: u8,
    len_cols: u8,
    out_x_pos: u8,
    out_y_pos: u8,
}

#[generate_trait]
impl BoardImpl of BoardTrait {
    #[inline(always)]
    fn new(
        game_id: u32, len_rows: u8, len_cols: u8, out_x_pos: u8, out_y_pos: u8
    ) -> Board {
        Board { game_id, len_rows, len_cols, out_x_pos, out_y_pos }
    }
}

