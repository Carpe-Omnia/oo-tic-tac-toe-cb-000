class TicTacToe
  def initialize(board= Array.new(9," "))
    @board = board
  end
  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
    ]

  def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
  end

  def input_to_index(input)
    input.to_i - 1
  end

  def move(index, token="X")
    @board[index] = token
  end

  def position_taken?(index)
    !(@board[index].nil? || @board[index] == " ")
  end

  def valid_move?(index)
    spot = @board[index]
    if index > 8 || index < 0 || index % 1 != 0
      return false
    elsif spot == "" || spot == " " || spot == nil
      return true
    else
      return false
    end
  end

  def turn
    dex = 0
    token = current_player
    loop do
      puts "Please enter 1-9:"
      input = gets
      dex = input_to_index(input)
      break if valid_move?(dex)
    end
    move( dex, token)
    display_board
  end

  def turn_count
    turn = 0
    @board.each do |spot|
      if spot == " " || spot == "" || spot == nil
        turn += 0
      else
        turn += 1
      end
    end
  return turn
  end

  def current_player
    turns_elapsed = turn_count
    if turns_elapsed % 2 != 0
      player = "O"
    else
      player = "X"
    end
    return player
  end

  def x_won?(win_combo)
    win_combo.all? do |index|
      @board[index] == "X"
    end
  end

  def o_won?(win_combo)
    win_combo.all? do |index|
      @board[index] == "O"
    end
  end

  def won?
    winner = []
    WIN_COMBINATIONS.each do |win_combo|
      if x_won?(win_combo) == true
        winner = win_combo
      elsif o_won?(win_combo) == true
        winner = win_combo
      end
    end
    if winner == []
      return false
    end
    return winner
  end

  def full?
    @board.all? do |space|
      space == 'X' || space == 'O'
    end
  end
  
  def draw?
    if full? == true && won? == false
      return true
    else
      return false
    end
  end

  def over?
    if won?( != false
      return true
    elsif full? == true
      return true
    elsif draw? == true
      return true
    else
      return false
    end
  end
  
end
