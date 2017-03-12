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

  context "#add" do
    context "when position is not busy" do
      it "adds a claim to a log" do
        claim_log.add(player, 1, 1)
        expect(claim_log.log[0]).to eq(player)
      end
      it "returns continue status" do
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

  context('#won?') do
    context "returns true if player fills all the fields in a row" do
      it "first row" do
        claim_log.log = [1,1,1,4,5,6,7,8,9]
        expect(claim_log.won?).to eq(true)
      end
      it "socond row" do
        claim_log.log = [1,2,3,1,1,1,7,8,9]
        expect(claim_log.won?).to eq(true)
      end
      it "third row" do
        claim_log.log = [1,2,3,4,5,6,1,1,1]
        expect(claim_log.won?).to eq(true)
      end
    end
    context "returns true if player fills all the fields in a column" do
      it "first column" do
        claim_log.log = [1,2,3,1,5,6,1,8,9]
        expect(claim_log.won?).to eq(true)
      end
      it "socond column" do
        claim_log.log = [1,2,3,4,2,6,7,2,9]
        expect(claim_log.won?).to eq(true)
      end
      it "third column" do
        claim_log.log = [1,2,1,4,5,1,7,8,1]
        expect(claim_log.won?).to eq(true)
      end
    end
    context "returns true if player fills all the fields in a diagonal" do
      it "first diagonal" do
        claim_log.log = [1,2,3,4,1,6,7,8,1]
        expect(claim_log.won?).to eq(true)
      end
      it "socond diagonal" do
        claim_log.log = [1,2,1,4,1,6,1,8,9]
        expect(claim_log.won?).to eq(true)
      end
    end
    it "return false if lost" do
      claim_log.log = [1,2,3,4,5,6,7,8,9]
      expect(claim_log.won?).to eq(false)
    end
  end

  context "draw?" do
    context "when it is a draw" do
      it "returns DRAW" do
        claim_log.log = [1,2,3,4,5,6,7,8,9]
        expect(claim_log.draw?).to eq(ClaimLog::DRAW)
      end
    end
    context "when it is not a draw" do
      it "returns CONTINUE" do
        claim_log.log = [1,1,1,1,nil,1,1,1,1]
        expect(claim_log.draw?).to eq(ClaimLog::CONTINUE)
      end
    end
  end
end
