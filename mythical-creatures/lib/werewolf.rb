
class Werewolf
  attr_accessor :name, :location
  def initialize(n, l = 'London')
    self.name = n
    self.location = l
    @human = true
    @hungry = false
  end

  def human?
    @human
  end

  def change!
    @human = !@human
    @hungry = true if @human == false
  end

  def wolf?
    !@human
  end

  def hungry?
    @hungry
  end

  def eat(victim)
    if !@human
      victim.status = :dead
      @hungry = false
      victim.killed_by = self.name
    end
  end
end
