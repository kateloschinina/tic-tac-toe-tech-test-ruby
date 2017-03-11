describe 'Feature Tests' do
  player_one = Player.new
  player_two = Player.new
  game = Game.new(player_one, player_two)

  it 'There are two players in the game' do
    expect(game.player_X).to eq(player_one)
    expect(game.player_O).to eq(player_two)
  end

  it 'Players can take turns. A turn ends when a player claims a field' do
    expect(game.turn).to eq(player_one)
    game.new_claim(1,2)
    expect(game.turn).to eq(player_two)
  end
end
