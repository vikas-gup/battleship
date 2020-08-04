class Position
  attr_reader :coord
  attr_accessor :cardinal

  def initialize(x, y)
    @coord = Coord.new(x, y)
  end
end
