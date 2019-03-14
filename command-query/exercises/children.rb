class Children
  def initialize
    @children = []
  end

  def <<(child)
    @children << child
  end

  def eldest
    if !@children.empty?
      eldest = ''
      @children.each_with_index do |child, i|
        eldest = child if i == 0
        eldest = child if child.age > eldest.age
      end
      eldest
    else
      nil
    end
  end
end
