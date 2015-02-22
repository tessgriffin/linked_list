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

  def count_iterative
    current = @head
    if current.nil?
      return 0
    elsif current.next_node.nil?
      return 1
    else      
      counter = 1
      while current.next_node != nil
        counter = counter + 1
        current = current.next_node
        if current.next_node == nil
          return counter
        end
      end
    end
  end

  def last_node_data
    current = @head
    if current.nil?
      return nil
    elsif current.next_node.nil?
      return @head.name
    else      
      while current.next_node != nil
        current = current.next_node
        if current.next_node == nil
          return current.name
        end
      end
    end

  end

  def pop_iteratively
    current = @head
    previous = nil
    if current.nil?
      return nil
    elsif current.next_node.nil?
      @head = nil
    else   
      while current.next_node != nil   
        previous = current
        current = current.next_node
        if current.next_node == nil
          previous.next_node = nil
        end
      end
    end
  end

end



class RecursiveLinkedList < IterativeLinkedList

  attr_accessor :head

  def initialize
    @head = nil
    @tail = nil
    @counter = 1
  end

  def count_recursive
    current = @head
    if current.nil?
      return 0
    elsif current.next_node.nil?
      return 1
    else      
      @counter = @counter + 1
      current = current.next_node
      if current.next_node != nil
        count_iterative
      else 
        return @counter
      end
    end
  end

  def last_node_data_recursive
    current = @head
    if current.nil?
      return nil
    elsif current.next_node.nil?
      return @head.name
    else      
      current = current.next_node
      if current.next_node != nil
      #  last_node_data_recursive
      else
        return current.name
      end
    end
  end

    

end

list = RecursiveLinkedList.new
node1 = Node.new("Kirk")
node2 = Node.new("Spock")
node3 = Node.new("Sulu")

list.add_node_to_bottom(node1)
list.add_node_to_bottom(node2)
list.add_node_to_bottom(node3)





