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


end
