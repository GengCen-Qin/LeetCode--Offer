# frozen_string_literal: true
require "minitest/autorun"
require_relative "linked_list"

class LinkedListTest < Minitest::Test
  def test_nothing
    assert(true)
  end

  def setup
    @list = LinkedList.new
  end

  def test_canCreateLinkedList_isEmpty
    assert @list.is_empty?
  end

  def test_canInsertToLinkedList_notEmpty
    @list.insert(0)
    refute @list.is_empty?
  end

  def test_afterInsertX_thenPollX
    @list.insert(0)
    ele = @list.poll
    assert_equal(0, ele)

    @list.insert(1)
    ele = @list.poll
    assert_equal(1, ele)
  end

  def test_afterInsertXThenPop_isEmpty
    @list.insert(0)
    @list.poll
    assert(@list.is_empty?)
  end

  def test_insertXAndY_sizeIsTwo
    @list.insert(0)
    @list.insert(1)
    assert_equal(2, @list.size)
  end

  def test_insertXAndY_pollXThenY
    @list.insert(0)
    @list.insert(1)
    assert_equal(0, @list.poll)
    assert_equal(1, @list.poll)
  end

  def test_insertXAndYAndZ_pollXThenYThenZ
    @list.insert(0)
    @list.insert(1)
    @list.insert(2)
    assert_equal(0, @list.poll)
    assert_equal(1, @list.poll)
    assert_equal(2, @list.poll)
  end

  def test_insertXAndYAndZ_sizeIsThree
    @list.insert(0)
    @list.insert(1)
    @list.insert(2)
    assert_equal(3, @list.size)
  end

  def test_afterInsertXAndY_peekIsX
    @list.insert(0)
    @list.insert(1)
    assert_equal(0, @list.peek)
  end

  def test_emptyLinkedListPoll_isNil
    assert_nil(@list.poll)
  end

  def test_emptyLinkedListPeek_isNil
    assert_nil(@list.poll)
  end

  def test_full
    assert(@list.is_empty?)
    assert_nil(@list.poll)

    @list.insert(1)
    @list.insert(2)
    @list.insert(3)
    @list.insert(4)
    @list.insert(5)

    assert_equal(1, @list.poll)
    assert_equal(2, @list.poll)
    assert_equal(3, @list.poll)
    assert_equal(4, @list.poll)
    assert_equal(5, @list.poll)
    assert_nil(@list.poll)
  end

  def test_findXInEmptyLinkedList_isNil
    node = @list.find(1)
    assert_nil(node)
  end

  def test_findXInLinkedList
    @list.insert(1)
    node = @list.find(1)
    assert(node)

    @list.insert(2)
    node = @list.find(2)
    assert_equal(2, node.ele)

    assert_nil(@list.find(3))
  end

  def test_insertXAndY_TheNodeOfXIsY
    @list.insert(1)
    @list.insert(2)

    firstNode = @list.find(1)
    secondNode = @list.find(2)

    assert_equal(firstNode.next, secondNode)
  end

  def test_insertXAndY_ThePrevOfYIsX
    @list.insert(1)
    @list.insert(2)

    secondNode = @list.find(2)
    firstNode = @list.find(1)

    assert_equal(firstNode,secondNode.prev)
    assert_equal(secondNode,firstNode.next)
  end

  def test_lru_findXAndXIsHeader_notUpdate
    @list.insert(1)
    @list.find(1)
    assert_equal(1,@list.peek)
  end

  def test_lru_findXInEmptyList_insertX
    @list.find(1,true)
    assert_equal(1,@list.peek)
  end

  def test_lru_findXInList_insertXAndUpdateXToHeader
    @list.insert(1)
    @list.find(2,true)
    assert_equal(2,@list.peek)
  end

  def test_findX_xWillUpdateToHeaderIfExist
    @list.insert(1)
    @list.find(2,true)
    assert_equal(2,@list.peek)
  end

  def test_setMaxLength
    max_length = 10
    list = LinkedList.new(max_length)
    list = LinkedList.new
  end

  # def test_sizeEqualMaxLengthThenInsertX_useLURUpdate
  #   max_length = 1
  #   list = LinkedList.new(max_length)
  #   list.insert(1)
  #   list.insert(2)
  #   assert_equal(2,list.peek)
  #   assert_equal(max_length, list.size)
  # end
end
