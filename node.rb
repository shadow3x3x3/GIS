require_relative './edge'

# Record Node
class Node
  attr_accessor :id, :y, :x, :neighbors

  def initialize(attrs)
    attrs.class == Array ? init_array(attrs) : init_fixnum(attrs)
    @neighbors = []
  end

  def add_neighbor(node)
    @neighbors << node if @neighbors.include?(node)
  end

  private

  def init_array(attrs)
    @id = attrs.shift.to_i
    @x  = attrs.shift
    @y  = attrs.shift
  end

  def init_fixnum(attrs)
    @id = attrs
    @x  = -1
    @y  = -1
  end
end
