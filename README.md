# Tic Tac Toe
Tech test example, accomplished on week 10 of Makers Academy course.

## The brief
The rules of tic-tac-toe are as follows:

 - There are two players in the game (X and O)
 - Players take turns until the game is over
 - A player can claim a field if it is not already taken
 - A turn ends when a player claims a field
 - A player wins if they claim all the fields in a row, column or diagonal
 - A game is over if a player wins
 - A game is over when all fields are taken

Build the business logic for a game of tic tac toe. It should be easy to implement a working game of tic tac toe by combining your code with any user interface, whether web or command line.


## Technologies used
* Ruby 2.4.0
* Rspec
* Pry

## Run program / test
To run the program
```
$ git clone git@github.com:kateloschinina/tic-tac-toe-tech-test-ruby.git
$ bundle install
$ bundle
```
Then to play with interface
```
$ pry
[1] pry(main)> require './lib/interface.rb'
=> true
[2] pry(main)> Interface.game_interface
```
And to run tests
```
$ rspec
```

## Thoughts on program structure
#### Class Player
 - Program should have two players (O and X)
 - Players do have names
 - Player class stores a name, gives a name by default, and assures player uniqueness

#### Class Game
 - Accepts players turn, stores this turn in TurnLog
 - Makes sure that players change turns
 - Make new claim

#### Class ClaimLog
 - Is an array of 9 dimension, stores players to corresponding cells
 - Checks whether the field was taken
 - Knows whether the game was won or there was a draw

#### Class Interface
The idea is to write a simple command line interface, that will allow to test what program does.
 - Asks first and second players to enter their names
 - Welcomes players; prints empty board, suggests players to play
 - Takes input from command line one by one (column and row of the game). If the field is already taken requests to re-enter the turn
 - Announces the winner, or announces draw otherwise

Please note, that interface is just an example of the one that could be used together with the program, therefore was not TDD designed.

### Example of interface usage
```
> Player One, please enter your name, you will be X:
Kat
> Player Two, please enter your name, you will be O:
Ivan
> Current turn: Kat
> Enter your claim, column first:
1
> and then row:
1
> Game is on
> This is your latest game state
 X - -
 - - -
 - - -
> Current turn: Ivan
> Enter your claim, column first:
2
> and then row:
2
> Game is on
T> his is your latest game state
 X - -
 - O -
 - - -
> Current turn: Kat
> Enter your claim, column first:
2
> and then row:
2
> You can't claim this cell, it is busy
> Current turn: Kat
> Enter your claim, column first:
3
> and then row:
2
> Game is on
> This is your latest game state
 X - -
 - O X
 - - -
> Current turn: Ivan
> Enter your claim, column first:
3
> and then row:
3
> Game is on
> This is your latest game state
 X - -
 - O X
 - - O
> Current turn: Kat
> Enter your claim, column first:
2
> and then row:
1
> Game is on
> This is your latest game state
 X X -
 - O X
 - - O
> Current turn: Ivan
> Enter your claim, column first:
2
> and then row:
3
> Game is on
> This is your latest game state
 X X -
 - O X
 - O O
> Current turn: Kat
> Enter your claim, column first:
3
> and then row:
1
> Kat won the game
> This is your latest game state
 X X X
 - O X
 - O O
=> "Kat won the game"
```
