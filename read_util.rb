# Reading raw file module
module ReadUtil
  def initialize_edges(raw_edges)
    raw_edges.each_line do |edge|
      edge = edge.split.map!(&:to_f)
      add_edge(edge)
    end
  end

  def initialize_nodes(raw_nodes)
    raw_nodes.each_line do |node|
      node = node.split.map!(&:to_f)
      p node
      add_node(node)
    end
  end

  def clean_array(raw_array, array2_size)
    array = []
    until raw_array.empty?
      line_array = []
      array2_size.times { line_array << raw_array.shift }
      array << line_array
    end
    array
  end
end
