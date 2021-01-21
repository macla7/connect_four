require './lib/game.rb'

describe Game do
  subject {Game.new}
  context 'Making Comp' do
    describe '#comp' do
      it "should define comp with 'X' or 'O'" do
        subject.name_and_piece
        subject.comp
        expect(subject.comp_piece).to match(/(X|O)/)
      end

      it 'should define comp with opposing piece' do
        subject.name_and_piece
        expect(subject.comp_piece).not_to eql(subject.human.piece)
      end
    end
  end

end

describe Player do
  subject {Player.new}
  context 'getting player input on name and piece' do
    describe '#name_and_piece' do
      it 'should get their name' do
        subject.give_name
        expect(subject.name).to match(/\w/)
      end

      it "it should test if piece is 'X' or 'O'" do
        subject.give_piece
        expect(subject.piece).to match(/(X|O)/)
      end
    end
  end

  context "Player's moves" do
    describe '#comp_move' do
      it 'should have a piece dropped in randomly' do
        expect([1,2,3,4,5,6,7].any?(subject.comp_move)).to eql(true)
      end
    end

    describe '#player_move' do
      it 'should place a piece in board' do
        expect([1,2,3,4,5,6,7].any?(subject.player_move)).to eql(true)
      end
    end
  end
end