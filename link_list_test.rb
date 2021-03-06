require 'minitest/autorun'
require 'minitest/pride'
require_relative 'link_list.rb'

#First we create an empty list. An empty list has nil as it's head

#What we know in a linked list is that:
# 1) we have a head
# 2) the data in the head (and whatever node you are on)
# 3) and whether there is a link to another node. 
#    If there is no next node, that's the tail and the next node is nil

#These are the states ^^^^^
#States are stored in instance variables @variable

#All a list needs to know is it's head. Then all the head knows about is
#it's state and it's link. So each node contains a reference to another node
#or to nil if it's the last node in the chain

#  def each(&block)
#   block.call(head)
#   tail.each(&block)
# end


class LinkListTest < Minitest::Test

  def test_node_class_exists
    assert Node
  end

  def test_it_can_create_new_node
    node1 = Node.new()
  end

  def test_nodes_have_a_name
    node1= Node.new("Jeff")
    assert_equal "Jeff", node1.name
  end

  def test_nodes_have_a_link_to_another_node
    list = RecursiveLinkedList.new
    node2 = Node.new("Rachel")
    node1 = Node.new("Jeff")
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    assert_equal node2, node1.next_node
  end

  def test_iterative_list_exits
    assert IterativeLinkedList
  end

  def test_it_can_create_empty_iterative_lists
    list = IterativeLinkedList.new
    assert_equal nil, list.head
  end

  def test_recursive_list_exits
    assert RecursiveLinkedList
  end

  def test_it_can_create_empty_recursive_lists
    list = RecursiveLinkedList.new
    assert_equal nil, list.head
  end

  def test_it_can_add_a_node_to_an_empty_list
    list = IterativeLinkedList.new
    list2 = RecursiveLinkedList.new
    node1 = Node.new("Horace")
    list.add_node_to_bottom(node1)
    list2.add_node_to_bottom(node1)
    assert_equal node1, list.head
    assert_equal "Horace", list.head.name
    assert_equal nil, list.head.next_node

    assert_equal node1, list2.head
    assert_equal "Horace", list2.head.name
    assert_equal nil, list2.head.next_node
  end


  def test_it_can_add_a_node_to_a_list_with_one_node
    list = RecursiveLinkedList.new
    list2 = IterativeLinkedList.new
    node1 = Node.new("Jeff")
    node2 = Node.new("May")
    node3 = Node.new("Spock")
    node4 = Node.new("Kirk")
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    assert_equal node2, list.head.next_node

 
    list2.add_node_to_bottom(node3)
    list2.add_node_to_bottom(node4)
    assert_equal node4, list2.head.next_node
    assert_equal "Kirk", list2.head.next_node.name
  end

  def test_added_nodes_are_the_last_node
    list = RecursiveLinkedList.new
    node = Node.new("Spock")
    node2 = Node.new("Kirk")
    list.add_node_to_bottom(node)
    list.add_node_to_bottom(node2)
    assert_equal nil, list.head.next_node.next_node
  end

  def test_it_can_count_number_of_elements_on_list_iteratively
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")    
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)
    count = list.count_iterative
    assert_equal 4, count
  end

  def test_it_can_count_number_of_elements_on_list_recursively
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")
    list.add_node_to_bottom(node1)
    assert_equal 1, list.count_recursive
    list.add_node_to_bottom(node2)
    assert_equal 2, list.count_recursive
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)  
    assert_equal 4, list.count_recursive  
  end

  def test_it_can_name_last_node_on_list_iteratively
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    last_node = list.last_node_data
    assert_equal "Kirk", last_node

    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)    
    last_node = list.last_node_data
    assert_equal "Picard", last_node
  end 

  def test_it_can_pop_last_element_iteratively_one_node_list
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    list.add_node_to_bottom(node1)
    list.pop_iteratively
    assert_equal nil, list.head
  end

  def test_it_can_pop_last_element_it_2_items
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    assert_equal 2, list.count_iterative

    list.pop_iteratively
    assert_equal 1, list.count_iterative
  end

  def test_it_can_pop_last_element_it_4_items
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")    
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)    
    assert_equal 4, list.count_iterative

    list.pop_iteratively
    assert_equal 3, list.count_iterative
  end

  def test_it_can_access_a_node_by_numeric_position_iteratively
    list = IterativeLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")    
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)  

    assert_equal "Spock", list.find_node(0)
    assert_equal "Kirk", list.find_node(1)
    assert_equal "Sulu", list.find_node(2)
    assert_equal "Picard", list.find_node(3)
  end

  def test_it_can_name_last_node_on_list_recursively
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    last_node = list.last_node_data_recursive(node1)
    assert_equal "Sulu", last_node

    list.add_node_to_bottom(node4)
    last_node2 = list.last_node_data_recursive(node1)
    assert_equal "Picard", last_node2
  end 


  def test_it_can_pop_last_element_recursive_one_node_list
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    list.add_node_to_bottom(node1)
    list.pop_recursive(node1)
    assert_equal nil, list.head
  end

  def test_it_can_pop_last_element_recursive_4_items
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")    
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)    
    assert_equal 4, list.count_recursive

    list.pop_recursive(node1)
    assert_equal 3, list.count_recursive
  end

  def test_it_can_access_a_node_by_numeric_position_recursively
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")
    node3 = Node.new("Sulu")
    node4 = Node.new("Picard")    
    list.add_node_to_bottom(node1)
    list.add_node_to_bottom(node2)
    list.add_node_to_bottom(node3)
    list.add_node_to_bottom(node4)  

    assert_equal "Spock", list.find_node_re(0, node1, 0)
    assert_equal "Kirk", list.find_node_re(0, node1, 1)
    assert_equal "Sulu", list.find_node_re(0, node1, 2)
    assert_equal "Picard", list.find_node_re(0, node1, 3)
  end

end