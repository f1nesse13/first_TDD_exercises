class Array
  def my_uniq
    uniq_arr = []
    self.each { |ele| uniq_arr << ele if !uniq_arr.include?(ele) }
    uniq_arr
  end

  def two_sum
    idx_arr = []
      self.each_with_index do |ele, i|
        self.each_with_index do |ele2, x|
           if ele + self[x] == 0 && x > i
            idx_arr << [i, x] 
           end
          end
      end
    idx_arr
  end

  def my_transpose
    transposed = Array.new(self.length) { [] }
    self.each do |ele|
      ele.each_with_index do |ele2, i|
        transposed[i] << ele2 
      end
    end
    transposed
  end

  def stock_picker
    best_days = []
    profit = 0
    cur_profit = 0
    self.each_with_index do |ele1, i|
      self.each_with_index do |ele2, x|
        profit = ele2 - ele1
        if profit > cur_profit && x > i
          cur_profit = profit
          best_days = [i, x]
        end
      end
    end
    best_days
  end
end

class Towers
  attr_accessor :board
    def initialize
      @board = [[3,2,1], [], []]
    end

    def valid_move?(start_pos, end_pos)
      return false unless [start_pos, end_pos].all? { |i| i.between?(0,2) }
      !@board[start_pos].empty? &&
      (@board[end_pos].empty? || @board[end_pos].last >
      @board[start_pos].last)
    end

    def move(start_pos, end_pos)
      raise "that stack is empty" if @board[start_pos].empty?
      raise "can't move onto a smaller disc" if !valid_move?(start_pos, end_pos)
      @board[end_pos] << @board[start_pos].pop
    end

    def play
      until won?
          render
          puts "Pick a tower to move from"
          start_pos = gets.chomp.to_i
          puts "Where do you want to place the disc?"
          end_pos = gets.chomp.to_i

          if valid_move?(start_pos, end_pos)
            move(start_pos, end_pos)
          else
            puts "Invalid move"
          end
        end
      puts "Congratulations!"
    end

    def won?
      @board[0].empty? && @board[1..2].any?(&:empty?)
    end

    def render
      system("clear")
    board.each_with_index do |row, i|
      puts "Tower #{i}: #{row.join(" ")}"
    end
    end


end
# Towers.new.play