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

  it 'Players can not claim busy field' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(1,1)
    expect(game.status).to eq(Game::BUSY_STATUS)
  end

  it 'Player wins if they claim all the fileds in a column' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(2,1)
    game.new_claim(1,2)
    game.new_claim(2,2)
    game.new_claim(1,3)
    expect(game.status).to eq(game.turn.name + Game::WON_STATUS)
  end

  it 'Player wins if they claim all the fileds in a row' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(3,3)
    game.new_claim(2,1)
    game.new_claim(2,2)
    game.new_claim(3,1)
    expect(game.status).to eq(game.turn.name + Game::WON_STATUS)
  end

  it 'Player wins if they claim all the fileds in a diagonal' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(2,1)
    game.new_claim(2,2)
    game.new_claim(2,3)
    game.new_claim(3,3)
    expect(game.status).to eq(game.turn.name + Game::WON_STATUS)
  end

  it 'If all fields are take but noone won than it is a draw' do
    game = Game.new(player_one, player_two)
    game.new_claim(1,1)
    game.new_claim(2,1)
    game.new_claim(3,1)
    game.new_claim(2,2)
    game.new_claim(1,2)
    game.new_claim(1,3)
    game.new_claim(3,2)
    game.new_claim(3,3)
    game.new_claim(2,3)
    expect(game.status).to eq(Game::DRAW_STATUS)
  end
end
