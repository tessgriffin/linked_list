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

  def node_count_iterative
    return nil if @head.nil?
    head = @head
    count = 0
    until head.nil?
      #yield head
      count += 1
      head = head.next_node
    end
    count
  end

  def last_node_data

  end

  def pop_node_at_end_it
    return nil if @head.nil?
    head = @head
    until head.nil?
      head = head.next_node
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

  def node_count_recursive()
    count = 0
    if @head.nil?
      return nil
    else
      count += 1
      head = head.next_node
      head.node_count_recursive()
    end
    count
  end
    

end

list = RecursiveLinkedList.new
node1 = Node.new("Kirk")
node2 = Node.new("Spock")
node3 = Node.new("Sulu")

list.add_node_to_bottom(node1)
list.add_node_to_bottom(node2)
list.add_node_to_bottom(node3)

count = list.count_recursive




