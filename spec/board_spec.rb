describe Board do

  subject(:board) { described_class.new(player_one, player_two) }
  let(:player_one) { spy(:player) }
  let(:player_two) { spy(:player) }


  context "class creation" do
    it "creates an instance of a class" do
      expect(board).to be_a(Board)
    end
  end

  context "turns" do
    it "first turn is of the first player" do
      expect(board.turn).to eq(player_one)
    end
  end

end
