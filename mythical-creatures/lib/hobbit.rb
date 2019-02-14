class Hobbit
  attr_accessor :name, :disposition, :age
  def initialize(n, d = 'homebody')
    self.name = n
    self.disposition = d
    self.age = 0
  end

  def celebrate_birthday
    self.age += 1
  end

  def adult?
    self.age > 32
  end

  def old?
    self.age > 100
  end

  def has_ring?
    self.name == 'Frodo'
  end

  def is_short?
    true
  end
end
