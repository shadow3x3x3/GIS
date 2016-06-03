require_relative './node'

# Record Edge
class Edge
  attr_accessor :id, :src, :dst, :attrs

  def initialize(attrs)
    @id    = attrs.shift.to_i
    @src   = Node.new(attrs.shift.to_i)
    @dst   = Node.new(attrs.shift.to_i)
    @attrs = attrs
  end
end
