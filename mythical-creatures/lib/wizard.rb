class Wizard
  attr_accessor :name
  def initialize(n, bearded: true)
    self.name = n
    @bearded = bearded
  end

  def bearded?
    @bearded
  end
end
