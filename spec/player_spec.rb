describe Player do

  subject(:player) { described_class.new }

  context "class creation" do
    it "creates an instance of a class" do
      expect(player).to be_a(Player)
    end
  end

end
