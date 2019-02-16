class Ogre
  attr_accessor :name, :home, :swings, :encounter_counter
  def initialize(n, h = 'Swamp')
    self.name = n
    self.home = h
    self.swings = 0
    self.encounter_counter = 0
  end

  def encounter(human)
    human.encounter_counter += 1
    self.encounter_counter += 1
    self.swing_at(human) if human.encounter_counter % 3 == 0

  end

  def swing_at(human)
    self.swings += 1
  end

  def apologize(human)
    human.encounter_counter = 0
    self.encounter_counter = 0
  end
end

class Human
  attr_accessor :name, :encounter_counter
  def initialize
    self.name = 'Jane'
    self.encounter_counter = 0
  end

  def notices_ogre?
    self.encounter_counter % 3 == 0 && !(self.encounter_counter == 0)
  end

  def knocked_out?
    self.encounter_counter % 6 == 0 && !(self.encounter_counter == 0)
  end
end
