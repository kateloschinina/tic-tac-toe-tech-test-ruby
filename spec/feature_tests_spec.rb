describe 'Feature Tests' do
  it 'There are two players in the game' do
    player_one = Player.new
    player_two = Player.new
    board = Board.new(player_one, player_two)
    expect(board.player_X).to eq(player_one)
    expect(board.player_O).to eq(player_two)
  end
end
