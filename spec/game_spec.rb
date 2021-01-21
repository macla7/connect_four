require './lib/game.rb'

describe Game do
  subject {Game.new}
  context 'getting player input on name and piece' do
    describe '#name_and_piece' do
      it 'should get their name' do
        subject.name
        expect(subject.human_name).to match(/\w/)
      end

      it "it should test if piece is 'X' or 'O'" do
        subject.piece
        expect(subject.human_piece).to match(/(X|O)/)
      end
    end

    describe '#comp' do
      it "should define comp with 'X' or 'O'" do
        subject.piece
        subject.comp
        expect(subject.comp_piece).to match(/(X|O)/)
      end

      it 'should define comp with opposing piece' do
        subject.piece
        expect(subject.comp_piece).not_to eql(subject.human_piece)
      end
    end
  end

  context "Player's moves" do
    describe '#comp_move' do
      it 'should have a piece dropped in randomly' do
        subject.comp_move
        expect(subject.set.board.flatten.any?(subject.comp_piece)).to eql(true)
      end
    end

    describe '#player_move' do
      it 'should place a piece in board' do
        subject.player_move
        expect(subject.set.board.flatten.any?(subject.human_piece)).to eql(true)
      end
    end
  end
end
