require './lib/board.rb'
require './lib/player.rb'

class Game
  attr_accessor :human, :set, :comp_piece
  def initialize
    @set = Board.new
  end

  def name_and_piece
    @human = Player.new
    @human.give_name
    @human.give_piece
  end

  def comp
    @comp_piece = 'O' if @human.piece == 'X'
    @comp_piece = 'X' if @human.piece == 'O'
    @comp = Player.new('Computron', @comp_piece)
  end

  def game_loop
    loop do
      set.drop_piece(@human.piece, @human.player_move)
      set.drop_piece(@comp.piece, @comp.comp_move)
      set.display_board
      break if @set.game_over?
    end
  end
end

games = Game.new
games.name_and_piece
games.comp
games.game_loop
