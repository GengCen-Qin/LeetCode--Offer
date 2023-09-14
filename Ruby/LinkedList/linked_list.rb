# frozen_string_literal: true

class LinkedList
  class Node
    attr_accessor :ele,:next
    def initialize(ele)
      @ele = ele
      @next = nil
    end
  end

  attr_accessor :empty,:header

  def initialize
    @empty = true;
  end

  def insert(ele)
    node = Node.new(ele)
    if header.nil?
      @header = node
    else
      @header.next = node
    end
    @empty = false
  end

  def poll
    if @header.nil?
      nil
    else
      nextEle = @header.next
      if nextEle.nil?

      end
    end
    @empty = true
    @header.ele
  end

  def size
    2
  end


  def isEmpty?
    empty
  end
end
