class Grid
  PLACE_ERR = "ship placed ouside of grid and/or overlapping an exisitng one"
  COORD_ERR = -> (grid) { "coordinate is ouside of grid (#{grid.bot_left}) - (#{grid.top_right})" }
  # HIT = "Hit"
  # MISS = "Miss"
  # SINK = "Sink"

  #class PlacingError < StandardError; end

  # def self.factory(coord_class=Coord)
  #   new(coord_class.orig, coord_class.new(SIZE, SIZE))
  # end

  # def_delegators :@ships, :include?, :empty?, :size

  attr_reader :bot_left, :top_right
  attr_accessor :ships

  def initialize(bot_left, top_right)
    @bot_left = bot_left
    @top_right = top_right
    @ships = []
  end

  # def to_s
  #   "bot_left=#{bot_left} top_right=#{top_right} ships=#{ships.size}"
  # end

  def add(ship)
    ships << ship
  end

  def shot(coord)
    #fail PlacingError.new(COORD_ERR.call(self)) unless included?(coord)
    damage_done = damages(coord)
    return damage_done
    # purge!
    # return SINK if data.any? { |d| d < 0 }
    # return HIT if data.any? { |d| d > 0 }
    # MISS
  end

 def damages(coord)
    damage_done = false
    self.ships.each do |ship|
      damage = ship.strike(coord)
      if damage
        damage_done = true
        if ship.strength <= 0
          self.ships.delete(ship)
        end
      end
    end
    return damage_done
  end

  private def purge!
    ships.reject!(&:empty?)
  end

  # private def valid?(ship)
  #   within?(ship) && !overlap?(ship)
  # end
  #
  # private def within?(ship)
  #   ship.footprint.all? { |coord| included?(coord) }
  # end
  #
  # private def included?(coord)
  #   coord >= bot_left && coord <= top_right
  # end
  #
  # private def overlap?(ship)
  #   footprint.any? do |coord|
  #     ship.footprint.any? { |c| c == coord }
  #   end
  # end
end
