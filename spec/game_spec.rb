describe Game do

  subject(:game) { described_class.new(player_one_name, player_two_name) }
  let(:player_one_name) { double :player_one_name }
  let(:player_two_name) { double :player_two_name }
  let(:column) { double :column }
  let(:row) { double :row }


  context "class creation" do
    it "creates an instance of a class" do
      expect(game).to be_a(Game)
    end

    it "stores players" do
      expect(game.player_X.name).to eq(player_one_name)
      expect(game.player_O.name).to eq(player_two_name)
    end

    it "first turn is of the first player" do
      expect(game.turn).to eq(game.player_X)
    end
  end

  context "#new_claim" do
    context "when claimed position is already busy" do
      before do
        allow(game.claim_log).to receive(:add).and_return(ClaimLog::BUSY)
        game.new_claim(column,row)
      end

      it "does not change a turn" do
        expect(game.turn).to eq(game.player_X)
      end

      it "assigns status to be busy" do
        expect(game.status).to eq(Game::BUSY_STATUS)
      end
    end
    context "when claimed position is not busy and game is not won" do
      before do
        allow(game.claim_log).to receive(:add).and_return(ClaimLog::CONTINUE)
        game.new_claim(column,row)
      end

      it "does change a turn" do
        expect(game.turn).to eq(game.player_O)
      end

      it "assigns status to continue" do
        expect(game.status).to eq(Game::DEFAULT_STATUS)
      end
    end
    context "when the message from ClaimLog is not clear" do
      it "raises an error message" do
        allow(game.claim_log).to receive(:add).and_return("something")
        expect{game.new_claim(column,row)}.to raise_error(Game::ERROR_MESSAGE)
      end
    end
  end
end
