# Ruby Chess

A text-based chess game built in Ruby.

## Instructions to Play

1. Download the zip file and navigate to the 'ruby_chess' directory in the terminal.
2. Install the Colorize gem using 'gem install colorize'.
3. Run 'ruby play.rb'.
4. Follow prompts.

## Features

- [x] Two-player game
- [x] Characters displayed as chess pieces
- [x] Displays grid for easier move selection
- [x] Prevents player from illegal moves and from moving into check
  * Prompts user to re-enter move(s) if invalidate coordinates or characters are entered
  * If first check passes, uses a "deep_dup" method to copy the board and perform the move, checking for validity

## To-Do List

- [ ] Add a computer player
- [ ] Add save/load game options
