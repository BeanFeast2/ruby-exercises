class Unicorn
  attr_accessor :name, :color

  def initialize(n, c = 'white')
    self.name = n
    self.color = c
  end

  def white?
    self.color == 'white'
  end

  def say(str)
    "**;* #{str} **;*"
  end

end
