class Dragon
  attr_accessor :name, :color, :rider
  def initialize(n, c, r)
    self.name = n
    self.color = c
    self.rider = r
    @belly_size = 1
  end

  def eat
    @belly_size += 1
  end

  def hungry?
    @belly_size > 3 ? false : true
  end
end
