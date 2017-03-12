describe ClaimLog do

  subject(:claim_log) { described_class.new }
  let(:player) { double :player }
  let(:player_two) { double :player }

  context "class creation" do
    it "creates an instance of a class" do
      expect(claim_log).to be_a(ClaimLog)
    end
    it "log is an empty array of 9 positions at creation" do
      array = Array.new(9)
      expect(claim_log.log).to eq(array)
    end
  end

  context('#add') do
    context "when position is not busy" do
      it "adds a claim to a log" do
        claim_log.add(player, 1, 1)
        expect(claim_log.log[0]).to eq(player)
      end
      it "returns busy status" do
        expect(claim_log.add(player, 1, 1)).to eq(ClaimLog::CONTINUE)
      end
    end
    context "when position is busy" do
      it "does not add a claim to a log" do
        claim_log.add(player, 1, 1)
        claim_log.add(player_two, 1, 1)
        expect(claim_log.log[0]).to eq(player)
      end
      it "returns busy status" do
        claim_log.add(player, 1, 1)
        expect(claim_log.add(player_two, 1, 1)).to eq(ClaimLog::BUSY)
      end
    end
    context "when game is won" do
      it "returns won status" do
        allow(claim_log).to receive(:won?).and_return(true)
        expect(claim_log.add(player, 1, 1)).to eq(ClaimLog::WON)
      end
    end
  end

  # context('#won?') do
  #   context "returns true if player fills all the fields in a row" do
  #     it "first row" do
  #       claim_log.log = ["X", "X", "X"]
  #       expect(claim_log.won?).to eq(true)
  #       claim_log.log = ["O", "O", "O"]
  #       expect(claim_log.won?).to eq(true)
  #     end
  #     it "socond row" do
  #       claim_log.log = ["","","","X", "X", "X"]
  #       expect(claim_log.won?).to eq(true)
  #       claim_log.log = ["","","","O", "O", "O"]
  #       expect(claim_log.won?).to eq(true)
  #     end
  #     it "third row" do
  #       claim_log.log = ["","","","","","","X", "X", "X"]
  #       expect(claim_log.won?).to eq(true)
  #       claim_log.log = ["","","","","","","O", "O", "O"]
  #       expect(claim_log.won?).to eq(true)
  #     end
  #   end
  # end
end
