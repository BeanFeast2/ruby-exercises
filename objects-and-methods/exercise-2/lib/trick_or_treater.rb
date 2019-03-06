class TrickOrTreater
  attr_accessor :bag, :sugar_level
  def initialize(custome)
    @custome = custome
    @bag = Bag.new
    @sugar_level = 0
  end

  def dressed_up_as
    @custome.style
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.count
  end

  def eat
    @sugar_level += @bag.candies.pop.sugar
  end
end
