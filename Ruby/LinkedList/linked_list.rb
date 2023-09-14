# frozen_string_literal: true

class LinkedList
  attr_accessor :header, :tail, :size

  class Node
    attr_accessor :ele, :next

    def initialize(ele)
      @ele = ele
      @next = nil
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
    end
    @tail = node
  end

  def poll
    return nil unless @header

    outEle = @header
    nextEle = @header.next

    if nextEle
      @header = nextEle
    else
      @header = nil
      @tail = nil
    end

    @size -= 1
    outEle.ele
  end

  def isEmpty?
    size == 0
  end

  def peek
    header.ele
  end
end
