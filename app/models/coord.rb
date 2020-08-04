class Coord
  class FactoryError < StandardError; end

  attr_reader :x, :y

  # def self.orig
  #   @orig ||= new(0, 0)
  # end
  #
  # def self.factory(data)
  #   new(*data.split(" "))
  # rescue ArgumentError
  #   fail FactoryError.new("coordinate must be specified as 'x y' (ie 1 2)")
  # end

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
