class Bag
  attr_accessor :candies
  def initialize
    @candies = []
  end

  def count
    @candies.length
  end

  def empty?
    @candies.empty?
  end

  def <<(candy)
    @candies << candy
  end

  def contains?(candy_type)
    @candies.each do |candy|
      if candy.type == candy_type
        return true
      else
        return false
      end
    end
  end

  def grab(candy_type)
    @candies.each_with_index do |candy,i|
      if candy.type == candy_type
        pulled_candy = @candies[i]
        @candies.delete_at(i)
        return pulled_candy
      end
    end
  end

  def take(candy_amount)
    @candies.pop(candy_amount)
  end
end
