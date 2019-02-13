class Vampire
  attr_accessor :name, :pet, :thirst

  def initialize(n, p = 'bat')
    self.name = n
    self.pet = p
    self.thirst = true
  end

  def thirsty?
    self.thirst
  end

  def drink
    self.thirst = false
  end
end
