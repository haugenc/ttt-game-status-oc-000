# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left col
  [1,4,7], #Middle col
  [2,5,8], #Right col
  [0,4,8], #Diag 1
  [2,4,6]  #Diag 2
  ]

def won?(board)
  #for each winning array, check to see if the values
  #on the board are all X's or all O's

  WIN_COMBINATIONS.each do |win| #
    if (win.all?{|i| board[i].eql? "X"} || win.all?{|i| board[i].eql? "O"})
      return win
    end
  end
  return false
end

def draw?(board)
  #check if board is full and no one has won
  full?(board) && !(won?(board))
end

def empty?(board)
  #determine if all elements of the board
  #are equal to " "

  board.all?{|i| i.eql? " "}
end

def full?(board)
  #determine if all elements of the board
  #are not equal to " "
  board.all?{|i| !(i.eql? " ")}
end

def over?(board)
  #check if board is full and no one has won

  full?(board) || won?(board)
end

def winner(board)
  #the winner is token at one of the winning indexes

  if won?(board)
    return board[won?(board)[0]]
  else
    return nil
  end
end
