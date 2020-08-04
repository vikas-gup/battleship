class Ship
  TYPE = {
    'P' => 'P',
    'Q' => 'Q'
  }

  STRENGTH = {
    'P' => 1,
    'Q' => 2
  }

  attr_accessor :type, :len, :wid, :position, :strength

  def initialize(len, wid, type)
    @len = len.to_i
    @wid = wid.to_i
    @type = TYPE[type]
    @position = position
    @strength = 0
  end

  def place(position)
    self.position = position
    self.strength = (self.strength + Ship::STRENGTH[self.type])
  end

  def compare(misl_coord, ship_cord)
    ship_cord_x = ship_cord.x.ord
    ship_end_x = ship_cord_x.ord + self.len.to_i
    ship_cord_y = ship_cord.y.to_i
    ship_end_y = ship_cord.y.to_i + self.wid.to_i
    misl_coord_x = misl_coord[0].ord
    misl_coord_y = misl_coord[1].to_i
    return (ship_cord_x <=  misl_coord_x && ship_end_x >= misl_coord_x && ship_cord_y <=  misl_coord_y  && ship_end_y >= misl_coord_y)
  end

  def strike(misl_coord)
    ship_cord = self.position.coord
    is_within = compare(misl_coord, ship_cord)
    if is_within
      self.strength = self.strength - 1
    end
    return is_within
  end
end
