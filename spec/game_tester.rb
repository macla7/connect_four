require './lib/game'

describe Player do
  describe '#win?' do
    it "sees if you've won the player" do
      player = Player.new
      expect(player.win?).to eql(true)
    end
  end

  describe '#win_across?' do
    it 'sees if you\'ve won sideways' do
      player = Player.new
      expect(player.win_across?).to eql(true)
    end
  end

  describe '#win_diagonally_sw?' do
    it 'sees if you\'ve won on the diagonal' do
      player = Player.new
      expect(player.win_diagonally?).to eql(true)
    end
  end

  describe '#win_diagonally_se?' do
    it 'sees if you\'ve won on the diagonal' do
      player = Player.new
      expect(player.win_diagonally?).to eql(true)
    end
  end

  describe '#win_down?' do
    it 'see if you\'ve won down' do
      player = Player.new
      expect(player.win_down?).to eql(true)
    end
  end

  describe '#place' do
    it 'places your colour down' do
      game = Game.new
      human = Player.new
      machine = Machine.new
      expect(human.place(human.colour)).to eql(puts " @@board[#{human.i}, #{human.j}]")
    end
  end
end