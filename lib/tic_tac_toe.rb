

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [6, 4, 2]
  ]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def valid_move?(board, index)
  if position_taken?(board, index) == false
    if index.between?(0,8)
     true
   end 
  end
end



def position_taken?(board, index)
  if board[index] == "X" || board[index] == "O"
    true 
  else 
    false
end
end

def input_to_index(user_input)
 index = user_input.to_i - 1
end

def turn_count(board)
counter = 0  
 board.each do |space|
   if space == "X" || space == "O"
     counter += 1
   end
 end
 counter 
end




def turn(board)
  puts "Please enter 1-9:"
  index = input_to_index(gets.strip)
  if valid_move?(board, index) == true 
    player_move(board, index,current_player(board))
    display_board(board)
  else 
    turn(board)
  end 
end 

def current_player(board)
  if turn_count(board).even?
    return "X"
  else
    return "O"
  end 
end

def player_move(board, index, player_token)
  board[index] = player_token
  board
end

def valid_move?(board, index)
  if position_taken?(board, index) == false
    if index.between?(0,8)
     true
   end 
  end
end

def won?(board)
  WIN_COMBINATIONS.each do |combo|
   if board[combo[0]] != " " && board[combo[0]] == board[combo[1]] && board[combo[1]] == board[combo[2]]
    return combo 
   end 
  end 
  false 
end 


def full?(board)
 board.all? do |position|
   position != " "
 end 
end 


def draw?(board)
  if full?(board)
    if won?(board) == false
      return true 
    end 
  end 
end 
def over?(board)
  if won?(board) != false || draw?(board) == true 
    true 
  end 

end 

def winner(board)
  if over?(board) 
    if draw?(board) != true 
      combo = won?(board)
      index = combo[0]
      board[index]
    end 
  end 

end 

def play(board)
  until over?(board) do 
    turn(board)
  end 
  if draw?(board) != true 
   puts "Congratulations " + winner(board) + "!"
  else
    puts "Cat's Game!"
  end 
end 
