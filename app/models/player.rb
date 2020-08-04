# require "forwardable"
# require "battleship/grid"
# require "battleship/position"
# require "battleship/ship"

class Player
  #extend Forwardable

  PLACE_MSG = -> (player, ship) { "Placed #{player.name} ship on grid at position: #{ship.position.coord.x}, #{ship.position.coord.y}" }
  SHOT_MSG = -> (player, coordinate) { "#{player.name} attacked at #{coordinate}" }
  #TIP_MSG = -> (shot, coord) { "#{shot}, you should try with the (#{coord}) coordinates next time" }
  #TIP_THRESHOLD = 3

  class MissesError < StandardError; end

  #def_delegator :@grid, :empty?, :gameover?

  attr_reader :name, :grid, :ships
  attr_accessor :enemy

  def initialize(name, bt_width, bt_height, output = STDOUT)
    @name = name
    @grid = Grid.new(bt_width, bt_height)
    @misses = 0
    @output = output
    @pos = nil
    @coord = nil
  end

  def total_strength
    sum = 0
    grid.ships.each do |ship|
      sum += ship.strength
    end
    return sum
  end

  def gameover?
    self.total_strength == 0
  end

  def setup(ship_type, len, width, cordinate)
    ship = Ship.new(len, width, ship_type)
    place(ship, cordinate)
  end

  def place(ship, ship_cordinate)
    ship_cordinate = ship_cordinate.split("")
    x = ship_cordinate[0]
    y = ship_cordinate[1]
    pos = Position.new(x, y)
    ship.place(pos)
    grid.add(ship)
    @output.puts(PLACE_MSG.call(self, ship))
  # rescue grid.class::PlacingError, pos_class::FactoryError  => e
  #   @output.puts(e.message)
  #   @pos = nil
  #   retry
  end

  def shot(coordinate)
    @output.puts(SHOT_MSG.call(self, coordinate))
    shot = enemy.grid.shot(coordinate)
  #  @coord = nil
  # rescue grid.class::PlacingError, coord_class::FactoryError => e
  #   @output.puts(e.message)
  #   @coord = nil
  #   retry
  end

  # private def report(shot)
  #   return shot unless tip?(shot)
  #   coord = enemy.grid.footprint.sample
  #   #TIP_MSG.call(shot, coord)
  # end

  # private def tip?(shot)
  #   return reset! unless shot == grid.class::MISS
  #   @misses += 1
  #   @misses >= TIP_THRESHOLD
  # end

  # private def reset!
  #   @misses = 0
  #   false
  # end


end
