class Bag
  attr_accessor :count, :candies
  def initialize
    @count = 0
    @candies = Array.new
  end

  def <<(candy)
    @candies << candy
    @count += 1
  end

  def empty?
    @candies.empty?
  end

  def contains?(candy)
    @candies.each do|c|
      if c.type == candy
        return true
      else
        return false
      end
    end
  end
end
