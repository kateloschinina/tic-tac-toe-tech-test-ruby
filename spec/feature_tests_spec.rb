describe 'Feature Tests' do
  player_one = Player.new("Player One")
  player_two = Player.new("Player Two")

  it 'There are two players in the game' do
    game = Game.new(player_one, player_two)
    expect(game.player_X).to eq(player_one)
    expect(game.player_O).to eq(player_two)
  end

  it 'Players can take turns. A turn ends when a player claims a field' do
    game = Game.new(player_one, player_two)
    expect(game.turn).to eq(player_one)
    game.new_claim(1,2)
    expect(game.turn).to eq(player_two)
  end

  it 'Player wins if they claim all the fileds in a row' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(2,1)
    game.new_claim(1,2)
    game.new_claim(2,2)
    game.new_claim(1,3)
    expect(game.status).to eq("#{game.turn.name} won the game")
  end
end
