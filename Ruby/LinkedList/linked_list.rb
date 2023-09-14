# frozen_string_literal: true

class LinkedList
  attr_accessor :header, :tail, :size

  class Node
    attr_accessor :ele, :next, :prev

    def initialize(ele)
      @ele = ele
    end
  end

  def initialize
    @size = 0
  end

  def insert(ele)
    @size += 1
    node = Node.new(ele)
    if header.nil?
      @header = node
    else
      @tail.next = node
      node.prev = @tail
    end
    @tail = node
  end

  def poll
    return nil unless @header
    out_ele = @header
    next_ele = @header.next
    if next_ele
      @header.next = nil
      @header = next_ele
      @header.prev = nil
    else
      @header = nil
      @tail = nil
    end
    @size -= 1
    out_ele.ele
  end

  def is_empty?
    size == 0
  end

  def peek
    header.ele
  end

  def find(num)
    node = header
    while nil != node
      return node if node.ele == num
      node = node.next
    end
  end
end
