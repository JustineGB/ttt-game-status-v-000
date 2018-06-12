# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]

WIN_COMBINATIONS = [
  [0, 1, 2], #0 top row win
  [3, 4, 5], #1 middle row win
  [6, 7, 8], #2 bottom row win
  [0, 3, 6], #3 left column
  [1, 4, 7], #4  middle column
  [2, 5, 8], #5 right column
  [0, 4, 8], #6 diagonal left
  [2, 4, 6] #7 diagonal right
]


def won?(board)
  WIN_COMBINATIONS.each do |win_combination|

      win_index_1 = win_combination[0] #012
      win_index_2 = win_combination[1] #345
      win_index_3 = win_combination[2] #678

      position_1 = board[win_index_1] #equals the board index of 012
      position_2 = board[win_index_2] #equals the board index of 345
      position_3 = board[win_index_3] #equals the board index of 678 (so all 'squares' of the board are covered with these lines)

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 =="O" && position_2 == "O" && position_3 == "O"
     return win_combination
   else
     false
   end
 end
end

def full?(board)
    if position_taken?.all? do |move|
      move == "X" || move == "O"
    end
    else
      false
  end
end


def draw?(board)
  if full?(board) && !won?(board)
    return true
      #board is full and no won = draw
    elsif !full?(board) && !won?(board) || !won?(board)
      #board = status won (regardless of whether it is full or not)
    return false
  end
end


def over?(board)
  #call on draw?, full?, and won? All will return FALSE unless the game is not yet over
  if full?(board) && won?(board) && draw?(board) == true
    return true
  else
    return false
  end
end

 def winner(board)
   #if X or O won..WIN_COMBINATIONS[]
   if won?("X") || won?("O") ? "X" : "O"
     return "X"
   elsif won?("O")
     return "O"
   else !won?(board)
     puts nil
   end
 end
