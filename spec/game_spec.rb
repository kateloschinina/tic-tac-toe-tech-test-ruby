describe Game do

  subject(:game) { described_class.new(player_one, player_two) }
  let(:player_one) { spy(:player) }
  let(:player_two) { spy(:player) }
  let(:column) { double :column }
  let(:row) { double :row }


  context "class creation" do
    it "creates an instance of a class" do
      expect(game).to be_a(Game)
    end
    it "stores players" do
      expect(game.player_X).to eq(player_one)
      expect(game.player_O).to eq(player_two)
    end
  end

  context "turns" do
    it "first turn is of the first player" do
      expect(game.turn).to eq(player_one)
    end
    it "turn changes after first claim" do
      game.new_claim(column,row)
      expect(game.turn).to eq(player_two)
    end
  end

  context "#new_claim" do
    it "new claim changes turn" do
      game.new_claim(column,row)
      expect(game.turn).to eq(player_two)
    end
    it "current player can make a claim" do
      game.new_claim(column,row)
      expect(game.last_claim).to be_a(Claim)
    end
    it "stores new claim" do
      game.new_claim(column,row)
      expect(game.last_claim).to be_a(Claim)
    end
  end

end
