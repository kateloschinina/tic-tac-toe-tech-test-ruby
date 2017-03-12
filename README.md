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
[TBD]

## Run program / test
[TBD]

## Initial thoughts on program structure
#### Class Player
 - Program should have two players (O and X)
 - Players should be able to:
     - claim a field (that is not already taken)
 - Players do have names

#### Class Game
 - Accepts players turn, stores this turn in TurnLog
 - Makes sure that players change turns

#### Class Claim
 - Stores field

#### Class ClaimLog
 - Is an array of 9 dimension, stores players to corresponding cells
 - Checks whether the field was taken
 - Knows whether the game was won or there was a draw

#### Class Interface
The idea is to write a simple command line interface, that will allow to test what program does.
 - Asks first and second players to enter their names
 - Welcomes players; prints empty board, suggests players to play
 - Takes input from command line one by one (column and row of the game). If the field is already taken requests to re-enter the turn
 - Congratulates in case if the game was won, or announces draw otherwise
