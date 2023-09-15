# frozen_string_literal: true

class LinkedList
  attr_accessor :header, :tail, :size, :max_length

  class Node
    attr_accessor :ele, :next, :prev

    def initialize(ele)
      @ele = ele
    end
  end

  def initialize(max_length = 20)
    @max_length = max_length
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

  # 插入到头部
  # @param ele 被插入的数据
  def insertHeader(ele)
    @size += 1
    node = ele.is_a?(Node) ? ele : Node.new(ele)
    node.next, header.prev = header, node if header
    @header = node
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
    header.ele if header
  end

  # 查询
  # @param num    [Integer]   要查询的内容
  # @param cache  [Boolean]   是否在查询不到时，进行缓存，默认false
  def find(num, cache = false)
    node = header
    node = node.next while nil != node and node.ele != num

    return header if node != nil and node == header

    if node and header
      node_before, node_after = node.prev, node.next
      node.prev, node.next = nil, header
      header.prev, node_before.next = node, node_after
      node_after.prev = node_before unless node_after.nil?
      @header = node
    end

    if node.nil? and cache
      node = Node.new(num)
      insertHeader(node)
    end
    node
  end
end
