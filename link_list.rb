class Node

  attr_reader :name
  attr_accessor :next_node

  def initialize(name="Horace", next_node=nil)
    @name = name
    @next_node = next_node
  end

  def add_node(node)
    @head_node = node
    @next_node = node
  end
  
end



class IterativeLinkedList < Node

  attr_accessor :head_node

  def initialize(head_node=nil)
    @head_node = head_node
  end

#  def add_node(node)
#    @head_node = node
#    @next_node = node
#  end

end



class RecursiveLinkedList < Node

  attr_accessor :head_node

  def initialize(head_node=nil)
    @head_node = head_node
  end

#  def add_node(node)
#    @head_node = node
#  end

end




