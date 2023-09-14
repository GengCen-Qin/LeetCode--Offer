# frozen_string_literal: true
require 'minitest/autorun'
require_relative 'sort'
class SortTest < Minitest::Test

  def test_nothing
    assert(true)
  end

  def test_quickSort
    assert_equal([],Sort.quick([]))
    assert_equal([1],Sort.quick([1]))
    assert_equal([1,2],Sort.quick([2,1]))
    assert_equal([1,2,3],Sort.quick([1,2,3]))
    assert_equal([1,2,3],Sort.quick([2,1,3]))
    assert_equal([1,2,3],Sort.quick([3,1,2]))
    assert_equal([1,2,3],Sort.quick([2,3,1]))
    assert_equal([1,2,3],Sort.quick([3,2,1]))
    assert_equal([1,2,3],Sort.quick([1,3,2]))
    assert_equal([1,2,3,4],Sort.quick([1,2,3,4]))
    assert_equal([1,2,3,4],Sort.quick([2,1,3,4]))
    assert_equal([1,2,3,4],Sort.quick([4,3,2,1]))
    assert_equal([1,1,2,3,4],Sort.quick([4,3,1,2,1]))
  end

  def test_bucketSort
    assert_equal([],Sort.bucket([]))
    assert_equal([1],Sort.bucket([1]))
    assert_equal([1,2],Sort.bucket([1,2]))
    assert_equal([1,2],Sort.bucket([2,1]))
    assert_equal([1,2,3],Sort.bucket([1,2,3]))
    assert_equal([1,2,3],Sort.bucket([2,1,3]))
    assert_equal([1,2,3],Sort.bucket([3,1,2]))
    assert_equal([1,2,3],Sort.bucket([2,3,1]))
    assert_equal([1,2,3],Sort.bucket([3,2,1]))
    assert_equal([1,2,3],Sort.bucket([1,3,2]))
    assert_equal([1,2,3,4,5],Sort.bucket([5,1,3,2,4]))
  end
end
