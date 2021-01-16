class Game
  @@board = {}
  def initialize
    for j in 1..6
      for i in 1..7
        @@board["[#{i}, #{j}]"] = ' ___ '
      end
    end
  end

  # Need to figure out my TDD approach here....
  def place(colour)
    puts "which column?"
    i = @i
    case ' ___ '
    when @@board["[#{i}, 6]"]
      @@board["[#{i}, 6]"] =  " #{@colour} "
      @j = 6
    when @@board["[#{i}, 5]"]
      @@board["[#{i}, 5]"] =  " #{@colour} "
      @j = 5
    when @@board["[#{i}, 4]"]
      @@board["[#{i}, 4]"] =  " #{@colour} "
      @j = 4
    when @@board["[#{i}, 3]"]
      @@board["[#{i}, 3]"] =  " #{@colour} "
      @j = 3
    when @@board["[#{i}, 2]"]
      @@board["[#{i}, 2]"] =  " #{@colour} "
      @j = 2
    when @@board["[#{i}, 1]"]
      @@board["[#{i}, 1]"] =  " #{@colour} "
      @j = 1
    end
    @last_move = @@board["[#{i}, #{@j}]"]
    puts " @@board[#{@i}, #{@j}]"
  end

  def print_board
    i = 0
    @@board.each do |key, value|
      if i == 7
        i = 0
        print "\n"
      end
      print value
      i += 1
    end
  end

  def win_down?
    place = @last_move
    if place.down == colour
      place = place.down
      if place.down == colour
        place = place.down
        if place.down == colour
          puts 'you\'ve won!'
        end
      end
    end
  end

  # sketching out what this would look like with nodes, but atm not sure how would work with my grid..
  def win_sideways?
    place = @last_move
    i = 1
    if place.right == colour
      i += 1
      place = place.right
      if place.right == colour
        i += 1
        place = place.right
        if place.right == colour
          i += 1
        end
      end
    end
    if place.left == colour
      i += 1
      place = place.left
      if place.left == colour
        i += 1
        place = place.left
        if place.left == colour
          i += 1
        end
      end
    end
    if i > 4
      puts 'you won'
    end
  end
end

class Player < Game
  attr_reader :colour, :i, :j
  def initialize
    super()
    @colour = 'Red'
    @spots = []
    @i = 2
    @j = nil
    @last_move = nil
  end
end

class Machine < Game
  attr_reader :colour, :i, :j
  def initialize
    super()
    @colour = 'Yel'
    @spots = []
    @i = 2
    @j = nil
  end
end

# NOTE !!!
# For some reason, when testing this you need to go rspec spec/game_tester
# The standard 'rspec' ain't enough... for some odd reason...
player = Player.new()
machine = Machine.new()
player.place("Red")
machine.place("Yel")
player.place("Red")
machine.place("Yel")
player.print_board