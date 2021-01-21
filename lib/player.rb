class Player
  attr_accessor :name, :piece, :answer

  def initialize(name = 'jeff', piece = 'na')
    @name = name
    @piece = piece
  end

  def give_name
    loop do
      puts 'Please enter your name:'
      @name = gets.chomp.to_s
      break if @name.size < 20
    end
  end

  def give_piece
    loop do
      puts "Please type either 'X' or 'O', for which piece you'd prefer:"
      @piece = gets.chomp.to_s
      break if @piece == 'X' || @piece == 'O'
    end
  end

  def comp_move
    rand(7)
  end

  def player_move
    loop do
      puts "Please pick a column 1-7, to place your #{@piece} piece."
      @answer = gets.chomp.to_i
      if @answer > 0 || @answer < 8
        return @answer
        break
      end
    end
  end
end