describe Claim do

  subject(:claim) { described_class.new(column, row) }
  let(:column) { double :column }
  let(:row) { double :row }

  context "class creation" do
    it "creates an instance of a class" do
      expect(claim).to be_a(Claim)
    end
  end
end
