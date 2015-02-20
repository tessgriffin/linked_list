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




class LinkListTest < Minitest::Test

  def test_node_class_exists
    assert Node
  end



end