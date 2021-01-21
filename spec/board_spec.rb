require './lib/board.rb'

describe Board do
  subject { Board.new }
  context 'creating board' do
    describe '#initialize' do
      it 'should create an empty array size 7' do
        expect(subject.board.size).to eql(7)
      end
    end

    it 'it should be 6 deep' do
      expect(subject.board.all? { |col| col.size == 6 }).to eq true
    end
  end

  context 'dropping piece' do
    describe '#drop_piece' do
      it 'should drop a piece' do
        subject.drop_piece('X', 2)
        expect(subject.board[1][5]).to eql('X')
      end

      it 'should not replace an existing piece' do
        subject.drop_piece('O',1)
        subject.drop_piece('X',1)
        expect(subject.board[0][5]).to eql('O')
      end
    end
  end

  context 'testing move' do
    describe '#valid_move?' do
      it 'should return false if col full' do
        6.times do
          subject.drop_piece('X', 2)
        end
        should be_drop_piece('X', 2) == false
      end

      it { should be_valid_move(1) }
    end
  end

  context 'wining' do
    describe '#win_col?' do
      it 'should return true if 4 in col' do
        6.times { subject.drop_piece('O', 7) }
        should be_win_col == 'O'
      end
    end

    describe '#win_row?' do
      it 'should return true if 4 in row' do
        4.times { |i| subject.drop_piece('X', i+1)}
        should be_win_row == 'X'
      end
    end

    describe '#win_diagonal_up_right?' do
      it 'should return true if 4 on diagonal up right' do
        6.times { subject.drop_piece('O', 7) }
        5.times { subject.drop_piece('O', 6) }
        4.times { subject.drop_piece('O', 5) }
        2.times { subject.drop_piece('O', 4) }
        should be_win_diagonal_up_right == 'O'
      end
    end

    describe '#win_diagonal_up_left?' do
      it 'should return true if 4 on diagonal up left' do
        subject.drop_piece('X', 4)
        4.times { subject.drop_piece('X', 1) }
        3.times { subject.drop_piece('X', 2) }
        2.times { subject.drop_piece('X', 3) }
        should be_win_diagonal_up_left == 'X'
      end
    end
  end

  context 'Game Over. Draw!' do
    puts "\n\n"

    describe '#draw?' do
      it { should_not be_draw }

      it 'should be a draw, when no more spots and no winner.' do
        subject.board.map! { |col| col.map! {'e'}}
        subject.display_board
        should be_draw
      end
    end
  end
end