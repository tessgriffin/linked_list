class Node

  attr_accessor :next_node, :name

  def initialize(name="Horace")
    @name = name
    @next_node = next_node
  end

  def remove_next_node(node)
    node.next_node = nil
  end

end



class IterativeLinkedList

  attr_accessor :head

  def initialize

    @head = nil

    @tail = nil

  end

  def add_node_to_bottom(node)
    if @head.nil?

      @head = node
      @tail = node
    else
      @tail.next_node = node
      @tail = node
    end
  end

end



class RecursiveLinkedList < IterativeLinkedList

  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
  end


end




