describe Player do

  subject(:player) { described_class.new }
  subject(:player_with_name) { described_class.new (name) }
  let(:name) { double :name }

  context "class creation" do
    it "creates an instance of a class" do
      expect(player).to be_a(Player)
    end
    it "stores name while creeation" do
      expect(player_with_name.name).to eq(name)
    end
    it "by default name is #{Player::DEFAULT_NAME}" do
      expect(player.name).to eq(Player::DEFAULT_NAME)
    end
  end

end
