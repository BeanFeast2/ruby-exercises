require_relative 'bag'
require_relative 'candy'

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

  def grab(type)
    candy = @candies.find{|candy| candy.type}
    @candies.delete(candy)
  end

  def take(candy_amount)
    @candies.pop(candy_amount)
  end
end
