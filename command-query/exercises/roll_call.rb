class RollCall
  def initialize
    @name_list = []
  end

  def <<(name)
    @name_list << name
  end

  def longest_name
    @name_list.max_by(&:length)
  end
end
