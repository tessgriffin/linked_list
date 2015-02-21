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

  def test_it_can_remove_items_from_end_of_list
    skip
    list = RecursiveLinkedList.new
    node = Node.new("Spock")
    node2 = Node.new("Kirk")
    list.add_node(node)
    node.add_node(node2)
    list.remove_next_node(node)
    assert_equal nil, node.next_node
    assert_equal nil , list.head_node.next_node
    assert_equal "Spock", list.head_node.name
  end

  def test_it_can_count_number_of_elements_on_list_recursively
    skip
    list = RecursiveLinkedList.new
    node1 = Node.new("Spock")
    node2 = Node.new("Kirk")


  end





end