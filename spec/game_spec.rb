require './lib/game.rb'

describe Game do
  context 'getting player input on name and piece' do
    game = Game.new

    describe '#name_and_piece' do
      it 'should get their name' do
        expect(game.human.name).to match(/\w/)
      end

      it "it should test if piece is 'X' or 'O'" do
        expect(game.human.piece).to match(/(X|O)/)
      end
    end

    describe '#comp' do
      it "should define comp with 'X' or 'O'" do
        expect(game.comp.piece).to match(/(X|O)/)
      end

      it 'should define comp with opposing piece' do
        expect(game.comp.piece).not_to eql(game.human.piece)
      end
    end
  end

  context "Player's moves" do
    game = Game.new
    describe '#comp_move' do
      it 'should have a piece dropped in randomly' do
        game.comp_move
        expect(game.set.board.flatten.any?(game.comp_piece)).to eql(true)
      end
    end

    describe '#player_move' do
      it 'should place a piece in board' do
        game.player_move
        expect(game.set.board.flatten.any?(game.human_piece)).to eql(true)
      end
    end
  end
end
