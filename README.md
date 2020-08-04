Assignment | Battleship Game

BattleShip Game
BattleShip is a turn-based two-player game that simulates a war between ships on an ocean.
Each player gets their own battle area with a certain number of ships placed in non-overlapping positions. The
ships might be of different sizes. Note, players cannot see each others ship's location.
There are two types of ships - type P and type Q. Type P ships can be destroyed by a single hit in each of their
cells and type Q ships require 2 hits in each of their cells.
A ship is considered destroyed when all of its cells are destroyed.
The player who destroys all the ships of the other player first wins the game. The game ends in a draw if none of
the players can destroy all of the other’s ships using a finite number of missiles.


****** Pre requisite ******

Ruby > 2.2

****** How to Run? ******

- `ruby game_play.rb`

****** Classes ******

- Game
- Player
- Grid
- Ship
- Position
- Coord
