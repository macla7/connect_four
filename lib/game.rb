require './lib/board.rb'
require './lib/player.rb'

class Game
  attr_accessor :human, :set, :human_piece, :comp_piece, :human_name
  def initialize
    @set = Board.new
  end

  def name
    loop do
      puts 'Please enter your name:'
      @human_name = gets.chomp.to_s
      break if @human_name.size < 20
    end
  end

  def piece
    loop do
      puts "Please type either 'X' or 'O', for which piece you'd prefer:"
      @human_piece = gets.chomp.to_s
      break if @human_piece == 'X' || @human_piece == 'O'
    end
  end

  def name_and_piece
    @human = Player.new(@human_name, @human_piece)
  end

  def comp
    @comp_piece = 'O' if @human_piece == 'X'
    @comp_piece = 'X' if @human_piece == 'O'
    @comp = Player.new('Computron', @comp_piece)
  end

  def comp_move
    set.drop_piece(@comp_piece, rand(7))
  end

  def player_move
    loop do
      puts "Please pick a column 1-7, to place your #{@human_piece} piece."
      answer = gets.chomp.to_i
      if answer > 0 || answer < 8
        set.drop_piece(@human_piece, answer)
        break
      end
    end
  end

  def game_loop
    loop do
      player_move
      comp_move
      set.display_board
      break if @set.game_over?
    end
  end
end

games = Game.new
games.name
games.piece
games.name_and_piece
games.comp
games.game_loop
