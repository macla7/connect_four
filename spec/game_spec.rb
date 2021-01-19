require './lib/game.rb'

describe Game do
  context 'getting player input on name and piece' do
    game = Game.new
    @human_name = 'john'
    @human_piece = 'X'

    # How to do user input with tests... ?
    describe '#name_and_piece' do
      it 'should get their name' do
        expect(game.name_and_piece)
      end
    end
  end
end