class Grid
  PLACE_ERR = "ship placed ouside of grid and/or overlapping an exisitng one"
  attr_reader :bot_left, :top_right
  attr_accessor :ships

  def initialize(bot_left, top_right)
    @bot_left = bot_left
    @top_right = top_right
    @ships = []
  end

  def add(ship)
    ships << ship
  end

  def shot(coord)
    damage_done = damages(coord)
    return damage_done
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
end
