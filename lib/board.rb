class Board
  attr_accessor :board
  def initialize
    @board = Array.new(7) {Array.new(6, ' ')}
  end

  def display_board
    6.times do |y|
      print '|'
      7.times do |x|
        print " #{@board[x][y]} |"
      end
      puts "\n"
    end
  end

  def drop_piece(type, col)
    unless valid_move?(col)
      puts 'column is full'
      return false
    end
    y = @board[col - 1].count(' ') - 1
    @board[col - 1][y] = type
  end

  def valid_move?(col)
    @board[col - 1].count(' ').positive?
  end

  def game_over?
    if [win_row?, win_col?, win_diagonal_up_left?, win_diagonal_up_right?, draw?].any?('X')
      puts 'X win\'s!'
    elsif [win_row?, win_col?, win_diagonal_up_left?, win_diagonal_up_right?, draw?].any?('O')
      puts 'O win\'s!'
    elsif draw? == true
      puts 'It\'s a draw!'
    else
      return false
    end
    true
  end

  def win_col?
    3.times do |y|
      7.times do |x|
        return 'X' if [@board[x][y],@board[x][y+1],@board[x][y+2],@board[x][y+3]].all?('X')
        return 'O' if [@board[x][y],@board[x][y+1],@board[x][y+2],@board[x][y+3]].all?('O')

        false
      end
    end
  end

  def win_row?
    6.times do |y|
      4.times do |x|
        return 'X' if [@board[x][y],@board[x+1][y],@board[x+2][y],@board[x+3][y]].all?('X')
        return 'O' if [@board[x][y],@board[x+1][y],@board[x+2][y],@board[x+3][y]].all?('O')

        false
      end
    end
  end

  def win_diagonal_up_left?
    5.downto(3) do |y|
      3.upto(6) do |x|
        return 'X' if [@board[x][y],@board[x-1][y-1],@board[x-2][y-2],@board[x-3][y-3]].all?('X')
        return 'O' if [@board[x][y],@board[x-1][y-1],@board[x-2][y-2],@board[x-3][y-3]].all?('O')

        false
      end
    end
  end

  def win_diagonal_up_right?
    5.downto(3) do |y|
      4.times do |x|
        return 'X' if [@board[x][y],@board[x+1][y-1],@board[x+2][y-2],@board[x+3][y-3]].all?('X')
        return 'O' if [@board[x][y],@board[x+1][y-1],@board[x+2][y-2],@board[x+3][y-3]].all?('O')

        false
      end
    end
  end

  def draw?
    if @board.flatten.none?(' ')
      return true
    end
  end
end