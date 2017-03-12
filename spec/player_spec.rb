describe Player do

  subject(:player) { described_class.new }

  context "class creation" do
    it "creates an instance of a class" do
      expect(player).to be_a(Player)
    end
    it "stores name while creeation" do
      expect(player).to be_a(Player)
    end
    it "by default name is #{Player::DEFAULT_NAME}" do
      expect(player).to be_a(Player)
    end
  end

end
