require './lib/game'

describe Board do
  context 'creating board' do
    set = Board.new
    describe '#initialize' do
      it 'should create an empty array size 7' do
        expect(set.board.size).to eql(7)
      end
    end
  end
end