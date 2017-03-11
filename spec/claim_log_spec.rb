describe ClaimLog do

  subject(:claim_log) { described_class.new }
  let(:claim) { double :claim }

  context "class creation" do
    it "creates an instance of a class" do
      expect(claim_log).to be_a(ClaimLog)
    end
    it "log is empty at creation" do
      expect(claim_log.log).to eq([])
    end
  end

  context('#add') do
    it "adds a claim to log" do
      claim_log.add(claim)
      expect(claim_log.log.last).to eq(claim)
    end
  end
end
