require 'player.rb'
require 'board.rb'

class Game
  def initialize
    set = Board.new
  end

  def name_and_piece
    puts 'Please enter your name:'
    @human_name = gets.chomp
    puts "Please type either 'X' or 'O', for which piece you'd prefer:"
    @human_piece = gets.chomp
    @human = Player.new(@human_name, @human_piece)
  end
end