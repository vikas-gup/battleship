class Coord
  attr_reader :x, :y
  def initialize(x, y)
    @x = x
    @y = y
  end

  def to_s
    "#{x} #{y}"
  end

  def >=(other)
    x >= other.x && y >= other.y
  end

  def <=(other)
    x <= other.x && y <= other.y
  end

  def ==(other)
    x == other.x && y == other.y
  end
end
