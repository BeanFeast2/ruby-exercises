class Pirate
  attr_accessor :name, :job, :booty
  def initialize(n, j = 'Scallywag')
    self.name = n
    self.job = j
    self.booty = 0
    @h_act_count = 0
    @booty_granted = 100
  end

  def commit_heinous_act
    @h_act_count += 1
  end

  def cursed?
    @h_act_count > 2
  end

  def rob_ship
    self.booty += @booty_granted
  end

  def hundred_booty_per_ship?
    @booty_granted == 100
  end
end
