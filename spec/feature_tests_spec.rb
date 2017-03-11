describe 'Feature Tests' do
  player_one = Player.new
  player_two = Player.new
  board = Board.new(player_one, player_two)

  it 'There are two players in the game' do
    expect(board.player_X).to eq(player_one)
    expect(board.player_O).to eq(player_two)
  end

  it 'Players can take turns' do
    expect(board.turn).to eq(player_one)
  end
end
