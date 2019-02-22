require 'pry'

class Node
  def accept visitor
    binding.pry
    raise NotImpelementedError.new
  end
end

module Visitable
  def accept visitor
    binding.pry
    visitor.visit self
  end
end

class IntegerNode < Node
  include Visitable

  attr_reader :value
  def initialize value
    @value = value
  end
end

class Ast < Node
  def initialize
    @nodes = []
    @nodes << IntegerNode.new(2)
    @nodes << IntegerNode.new(3)
  end

  def accept visitor
    @nodes.each do |node|
      binding.pry
      node.accept visitor
    end
  end
end

class DoublerVisitor
  def visit subject
    binding.pry
    puts subject.value * 2
  end
end

class TriplerVisitor
  def visit subject
    binding.pry
    puts subject.value * 3
  end
end

ast = Ast.new
binding.pry
puts "Doubler:"
ast.accept DoublerVisitor.new
binding.pry
puts "Tripler:"
ast.accept TriplerVisitor.new
binding.pry
# =>
# Doubler:
# 4
# 6
# Tripler:
# 6
# 9
