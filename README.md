# Conway's Game of Life

A commandline version of Conway's Game of Life.

## How to Play

### Prerequisites
- Download or cloan this repository.

### First, require lib/conway.rb into pry
```rb
pry
```
```rb
require_relative('lib/conway.rb')
```

Then create a new instance of the Board class and pass it a board size.
```rb
x= Board.new(16)
```
### Then create your board by calling the .create_board method.
```rb
x.create_board
```

### Use the .change_cell method to create some initial living cells
```rb
x.change_cell(3,5,1)
x.change_cell(2,5,1)
x.change_cell(3,6,1)
x.change_cell(4,5,1)
x.change_cell(12,10,1)
x.change_cell(12,8,1)
x.change_cell(13,8,1)
x.change_cell(3,9,1)
x.change_cell(3,10,1)
x.change_cell(4,15,1)
x.change_cell(5,14,1)
x.change_cell(5,12,1)
x.change_cell(13,1,1)
x.change_cell(14,2,1)
x.change_cell(15,3,1)
x.change_cell(15,5,1)
```

### View your board by calling the ,board method.
```rb
x.board
```

### Each living cell is represented by the number 1, and each dead cell is represented by the number 0. Your board should look like this:
```rb
[[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0],
 [0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
 [0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]]
```

### Call the .map_board method to change the board.
```rb
x.map_board
```

### Now, watch your board change!
