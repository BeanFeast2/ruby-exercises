class Medusa
  attr_accessor :name, :statues
  def initialize(n)
    self.name = n
    self.statues = []
  end

  def stare(victim)
    self.statues << victim
    victim.stoned = true
    #Assigns first element in array false then removes it if statues.length > 3
    self.statues.shift.stoned = false if self.statues.length == 4
  end
end

class Person
  attr_accessor :name, :stoned
  def initialize(n)
    self.name = n
    self.stoned = false
  end

  def stoned?
    self.stoned
  end
end
