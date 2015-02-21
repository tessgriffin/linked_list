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

#


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
    node2 = Node.new("Rachel")
    node1 = Node.new("Jeff", node2)
    assert_equal node2, node1.next_node
  end

  def test_iterative_list_exits
    assert IterativeLinkedList
  end

  def test_it_can_create_empty_iterative_lists
    list = IterativeLinkedList.new
    assert_equal nil, list.head_node
  end

  def test_recursive_list_exits
    assert RecursiveLinkedList
  end

  def test_it_can_create_empty_recursive_lists
    list = RecursiveLinkedList.new
    assert_equal nil, list.head_node
  end

  def test_it_can_add_a_node_to_an_empty_list
    list = IterativeLinkedList.new
    node1 = Node.new("Horace")
    list.add_node(node1)
    assert_equal node1, list.head_node
    assert_equal "Horace", list.head_node.name
    assert_equal nil, list.head_node.next_node
  end








end