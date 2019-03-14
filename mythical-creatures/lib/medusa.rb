class Medusa
  attr_accessor :name, :statues
  def initialize(n)
    @name = n
    @statues = []
  end

  def stare(victim)
    @statues << victim
    victim.stoned = true
    #Assigns first element in array false then removes it if statues.length > 3
    @statues.shift.stoned = false if @statues.length == 4
  end
end

class Person
  attr_accessor :name, :stoned
  def initialize(n)
    @name = n
    @stoned = false
  end

  def stoned?
    @stoned
  end
end
