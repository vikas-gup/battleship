#require "battleship/coord"
class Position

  # def self.factory(data)
  #   new(*data.split(" "))
  # rescue ArgumentError
  #   fail FactoryError.new("position must be specified as 'x y cardinal' (ie 1 2 N)")
  # end

  attr_reader :coord
  attr_accessor :cardinal

  def initialize(x, y)
    @coord = Coord.new(x, y)
    #@cardinal = check(cardinal)
  end

  def to_s
    "#{coord} #{cardinal}"
  end

  # private def check(cardinal)
  #   return cardinal if CARDINALS.include?(cardinal)
  #   fail CardinalError.new("#{cardinal} is not a valid cardinal point")
  # end
end
