# frozen_string_literal: true
require 'minitest/autorun'
require_relative 'linked_list'
class LinkedListTest < Minitest::Test
  def test_nothing
    assert(true)
  end

  def setup
    @list = LinkedList.new
  end

  def test_canCreateLinkedList_isEmpty

    assert @list.isEmpty?
  end

  def test_canInsertToLinkedList_notEmpty

    @list.insert(0)
    refute @list.isEmpty?
  end

  def test_afterInsertX_thenPollX
    @list.insert(0)
    ele = @list.poll
    assert_equal(0,ele)

    @list.insert(1)
    ele = @list.poll
    assert_equal(1,ele)
  end

  def test_afterInsertXThenPop_isEmpty
    @list.insert(0)
    @list.poll
    assert(@list.isEmpty?)
  end

  def test_insertXAndY_sizeIsTwo
    @list.insert(0)
    @list.insert(1)
    assert_equal(2,@list.size)
  end

  def test_insertXAndY_pollXThenY
    @list.insert(0)
    @list.insert(1)
    assert_equal(0,@list.poll)
    assert_equal(1,@list.poll)
  end

  # def test_insertXAndYAndZ_sizeIsThree
  #   @list.insert(0)
  #   @list.insert(1)
  #   @list.insert(2)
  #   assert_equal(3,@list.size)
  # end

  # def test_afterInsertXAndY_peekIsX
  #   @list.insert(0)
  #   @list.insert(1)
  #   assert_equal(0,@list.peek)
  # end
end