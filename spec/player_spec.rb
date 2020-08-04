require "helper"

describe Battleship::Player do
  let(:output) { StringIO.new }
  let(:grid) { Battleship::Grid.factory }
  let(:ship) { Battleship::Ship.small }
  let(:player) { Battleship::Player.new(name: "Test", grid: grid, output: output) }

  it "must factory a player with two ships and grid" do
    player = Battleship::Player.factory(name: "Elvis")
    player.grid.to_s.must_equal "bot_left=0 0 top_right=4 4 ships=0"
  end

  it "must place properly positioned ships" do
    player.instance_variable_set(:@pos, "0 1 N")
    player.setup(ship)
    player.grid.must_include ship
    output.string.strip.must_equal Battleship::Player::PLACE_MSG.call(ship)
  end

  it "must try to shot ships on enemy grid" do
    player.enemy = Battleship::Player.factory(name: "Test2")
    player.instance_variable_set(:@coord, "0 2")
    player.shot
    output.string.strip.must_equal "#{Battleship::Player::SHOT_MSG}\n#{Battleship::Grid::MISS}"
  end
end
