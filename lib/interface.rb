require_relative 'game'
require_relative 'player'
require_relative 'claim_log'

module Interface
  def Interface.game_interface
    puts "Player One, please enter your name, you will be X:"
    player_one = gets.chomp
    puts "Player Two, please enter your name, you will be O:"
    player_two = gets.chomp
    game = Game.new(player_one, player_two)
    while game.status == Game::DEFAULT_STATUS do
      play_turn(game)
      while game.status == Game::BUSY_STATUS do
        play_turn(game)
      end
      print_state(game, player_one, player_two)
    end
    game.status
  end

  private
  def Interface.print_symbol(i, game, player_one, player_two)
    game.claim_log.log[i] == player_one ? "X" : game.claim_log.log[i] == player_two ? "O" : "-"
  end

  def Interface.print_state(game, player_one, player_two)
    puts "This is your latest game state"
    puts " #{print_symbol(0, game, player_one, player_two)} #{print_symbol(1, game, player_one, player_two)} #{print_symbol(2, game, player_one, player_two)}\n #{print_symbol(3, game, player_one, player_two)} #{print_symbol(4, game, player_one, player_two)} #{print_symbol(5, game, player_one, player_two)}\n #{print_symbol(6, game, player_one, player_two)} #{print_symbol(7, game, player_one, player_two)} #{print_symbol(8, game, player_one, player_two)}"
  end

  def Interface.play_turn(game)
    puts "Current turn: #{game.turn}"
    puts "Enter your claim, column first:"
    claim_column = (gets.chomp.to_i - 1) % 3 + 1
    puts "and then row:"
    claim_row = (gets.chomp.to_i - 1) % 3 + 1
    puts game.new_claim(claim_column, claim_row)
  end
end
