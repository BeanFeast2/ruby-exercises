class TrickOrTreater
  attr_accessor :dressed_up_as, :bag
  def initialize(costume)
    @dressed_up_as = costume.style
    @bag = []
  end

  def empty?
    @bag.empty?
  end

  def has_candy?
    !@bag.empty?
  end

  def candy_count
    @bag.length
  end

  def eat
    @bag.shift
  end
end
