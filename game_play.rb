require './app/models/game.rb'
require './app/models/player.rb'
require './app/models/grid.rb'
require './app/models/ship.rb'
require './app/models/coord.rb'
require './app/models/position.rb'
require 'byebug'
class GamePlay
  def get_input
    puts("Enter width and height of battle area (for example: 5 E): ");
    #bt_width, bt_height = gets.split(" ")
    bt_width, bt_height = 5, 'E'
    puts "Width: #{bt_width}, Height: #{bt_height}"

    puts("Enter Ship Count: ");
    #ship_count = gets.to_i
    ship_count = 2
    puts "Total ships with each plAyer: #{ship_count}"

    ship_cordinates = []
    ship_count.times do
      puts("Enter ship info (for example: Q 1 1 A1 B2): ");
      #ship_info = gets.split(" ")
      #ship_cordinates << ship_info
    end
    ship_cordinates = [["Q", "1", "1", "A1", "B2"], ["P", "2", "1", "D4", "C3"]]
    puts "Ship Info: Count: #{ship_count}: Coordinates: #{ship_cordinates}"
    new_game = Game.new
    new_game.call(bt_height, bt_width, ship_count, ship_cordinates)
  end

  def start
    puts("Welcome to Battleship game!")
    puts("There are two type of ships - type P and type Q. Type P ships can be destroyed by a single hit in each of their cells and type Q ships require 2 hits in each of their cells.")
    puts("A ship is considered destroyed when all of its cells are destroyed. The player who destroys all the ships of other player first wins the game.")
    puts("-------------------------------------------")
    puts("Rules:")
    puts("-------------------------------------------")
    puts("1 <= Width of Battle area(M') <= 9")
    puts("A <= Height of Battle area(N') <= Z");
    puts("1 <= Number of battleships <= M'*N'")
    puts("Type of ship = {'P','Q'}")
    puts("1 <= Width of battleship <= M'")
    puts("A <= Height of battleship <= N'")
    puts("1 <= X coordinate of ship <= M'")
    puts("A <= Y coordinate of ship <= N'")
    puts("Note: Use space ' ' to seperate your input.")
    puts("Type 'EXIT' to quit the game.")
    puts("-------------------------------------------")
    puts()
    get_input
  end
end


 battle_ship_game = GamePlay.new
 battle_ship_game.start
