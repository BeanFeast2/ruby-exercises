class LeatherChair
  attr_accessor :faded
  def intialize(faded)
    @faded = false
  end

  def faded?
    @faded
  end

  def expose_to_sunlight
    @faded = true
  end
end
