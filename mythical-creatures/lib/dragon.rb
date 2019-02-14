class Dragon
  attr_accessor :name, :color, :rider, :belly_size
  def initialize(n, c, r)
    self.name = n
    self.color = c
    self.rider = r
    self.belly_size = 1
  end

  def eat
    self.belly_size += 1
  end

  def hungry?
    self.belly_size <= 3
  end
end
