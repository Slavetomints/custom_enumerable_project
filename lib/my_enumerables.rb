module Enumerable
  def my_all?(&block)
    for item in self
      if block.call(item) == false
        return false
      end
    end
    return true
  end

  def my_any?(&block)
    for item in self
      if block.call(item) == true
        return true
      end
    end
    return false
  end

  def my_count(&block)
    count = 0
    for item in self
      if block_given?
        if block.call(item) == true
        count += 1
        end
      else count += 1
      end
    end
    count
  end

  def my_each_with_index(&block)
    if block_given?
      index = 0
      self.my_each do |var|
        block.call(var, index)
        index += 1
      end
    end
  end

  def my_inject(start, &block)
    if block_given?
      initial_value = 0
      current_index = 0
      for item in self
        if initial_value == 0
          sum = block.call(start, self[current_index])
          current_index += 1
          initial_value += 1
        else
          sum = block.call(sum, self[current_index])
          current_index += 1
        end
      end
      sum
    end
  end

  def my_map(&block)
    if block_given?
      arr = []
      for item in self
        arr << block.call(item)
      end
    end
    arr
  end

  def my_none?(&block)
    if block_given?
      for item in self
        if block.call(item) == true
          return false
        end
      end
    end
    true
  end

  def my_select(&block)
    if block_given?
      arr = []
      for item in self
        if block.call(item) == true
          arr << item
        end
      end
    end
    arr
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  def my_each
    for item in self
      yield item
    end
  end
end
