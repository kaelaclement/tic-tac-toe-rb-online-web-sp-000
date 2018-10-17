# define what a win looks like
WIN_COMBINATIONS = [
  [0,1,2], # top row
  [3,4,5], # middle row
  [6,7,8], # bottom row
  [0,4,8], # \ diagonal
  [2,4,6], # / diagonal
  [0,3,6], # left column
  [1,4,7], # middle column
  [2,5,8] # right column
]

# make a board
def display_board(board)
  puts " #{board[0]} " + "|" + " #{board[1]} " + "|" + " #{board[2]} "
  puts "-----------"
  puts " #{board[3]} " + "|" + " #{board[4]} " + "|" + " #{board[5]} "
  puts "-----------"
  puts " #{board[6]} " + "|" + " #{board[7]} " + "|" + " #{board[8]} "
end

# convert 1-9 to 0-8. -1 for no integer?
def input_to_index(input)
  index = input.to_i - 1
end

# make a game move
def move (board, index, char = "X")
  board[index] = char
end

# check for empty spaces
def position_taken? (board,index)
  if board[index] == " " || board[index] == "" || board[index] == nil
    return false
  else
    return true
  end
end

# is the player allowed that move?
def valid_move?(board,index)
  if !index.between?(0,8)
    return false
  elsif !position_taken?(board,index)
    return true
  end
end

# take a valid turn
def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board,index)
    move(board,index)
    display_board(board)
  else
    turn(board)
  end
end

# counts turns
def turn_count(board)
  counter = 0
  board.each do |token|
    if token == "X" || token == "O"
      counter += 1
    end
  end
  return counter
end

# determines current player
def current_player(board)
  if turn_count(board) % 2 == 0
    player = "X"
  else
    player = "O"
    return player
  end
end
