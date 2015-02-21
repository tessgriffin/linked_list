class Node

  attr_reader :name, :next_node

  def initialize(name="Horace", next_node=nil)
    @name = name
    @next_node = next_node
  end

end



class IterativeLinkedList

  attr_accessor :head_node

  def initialize(head_node=nil)
    @head_node = head_node
  end

  def add_node(node)
    @head_node = node
  end

end



class RecursiveLinkedList

  attr_accessor :head_node

  def initialize(head_node=nil)
    @head_node = head_node
  end

  def add_node

  end

end




