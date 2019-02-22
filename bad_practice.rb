class IntegerNode
  def initialize(value)
    @value = value
  end

  def double
    @value * 2
  end
end

class Ast
  def initialize
    @nodes = []
    @nodes << IntegerNode.new(2)
    @nodes << IntegerNode.new(3)
  end

  def print_double
    @nodes.each do |node|
      puts node.double
    end
  end
end

ast = Ast.new
ast.print_double # => 4 6
