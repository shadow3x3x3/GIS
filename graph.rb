require_relative './graph_util'
require_relative './read_util'
require_relative './edge'
require_relative './node'

# Normal Graph class
class Graph
  include GraphUtil, ReadUtil

  attr_accessor :edges, :nodes

  def initialize(params = {})
    raw_nodes = params[:raw_nodes]
    raw_edges = params[:raw_edges]
    @dim   = params[:dim]
    @nodes = []
    @edges = []
    initialize_nodes(raw_nodes) unless raw_nodes.nil?
    initialize_edges(raw_edges) unless raw_edges.nil?
  end

  def get_all_paths(params)
    params[:nodes] = @nodes
    params[:edges] = @edges
  end

  def add_node(node)
    new_node = node.class == Node ? node : Node.new(node)
    @nodes << new_node unless duplicate_node?(new_node)
  end

  def add_edge(edge)
    new_edge = edge.class == Edge ? edge : Edge.new(edge)
    unless duplicate_edge?(new_edge)
      @edges << new_edge
      add_node(@edges.last.src)
      add_node(@edges.last.dst)
    end
  end
end

experiment = 'test'

case experiment
when 'salu'
  EDGE_PATH = './salu-data/salu_edge_160203_450.txt'.freeze
  NODE_PATH = './salu-data/salu_node_160203.txt'.freeze
  DIM       = 7
when 'test'
  EDGE_PATH = './test-data/test-edge.txt'.freeze
  NODE_PATH = './test-data/test-node.txt'.freeze
  DIM       = 4
when 'go'
  EDGE_PATH = './go-data/4_goEdge.txt'.freeze
  NODE_PATH = './go-data/node.txt'.freeze
  DIM       = 4
end

test_edges = File.read(EDGE_PATH)
test_nodes = File.read(NODE_PATH)

g = Graph.new(dim: DIM, raw_edges: test_edges, raw_nodes: test_nodes)

# g = Graph.new
# g.add_edge([0, 1, 2, 5.6, 8.0])
# g.add_edge([1, 1, 2, 5.6, 8.0])
p "edges: #{g.edges}"
p "nodes: #{g.nodes}"
