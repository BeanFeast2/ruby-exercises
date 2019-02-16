class Centaur
  attr_accessor :name, :breed
  def initialize(n, b)
    self.name = n
    self.breed = b
    @standing = true
    @activity_count = 0
    @rested = false
    @sick = false
  end

  def shoot
    if @activity_count >= 3 || !@standing
      "NO!"
    else
      @activity_count += 1
      "Twang!!!"
    end
  end

  def run
    if @activity_count >= 3 || !@standing
      "NO!"
    else
      @activity_count += 1
      "Clop clop clop clop!!!"
    end
  end

  def cranky?
    @activity_count >= 3
  end

  def rested?
    @activity_count >= 3
  end

  def standing?
    @standing
  end

  def laying?
    !@standing
  end

  def lay_down
    @standing = false
  end

  def stand_up
    @standing = true
  end

  def sleep
    if !@standing
      @rested = true
      @activity_count = 0
    else
      "NO!"
    end
  end

  def drink_potion
    if @standing
      @activity_count = 0
      @sick = true if @rested
    else
      "NO!"
    end
  end

  def sick?
    @sick
  end
end
