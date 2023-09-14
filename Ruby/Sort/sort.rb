# frozen_string_literal: true

class Sort
  def self.quick(arr)
    result = []
    if arr.size <= 1
      result = arr
    else
      mid = arr[0]
      middors = arr.select { |ele| ele == mid }
      lessors = arr.select { |ele| ele < mid }
      biggers = arr.select { |ele| ele > mid }
      result.concat(quick(lessors))
      result.concat(middors)
      result.concat(quick(biggers))
    end
    result
  end

  def self.bucket(arr)
    if arr.size > 1
      hash = {}

      (arr.max + 1).times do |index|
        hash[index] = []
      end

      arr.each do |ele|
        hash[ele] << ele
      end

      hash.reduce([]) do |accumulator,element|
        accumulator.concat(element[1])
      end
    else
      arr
    end
  end
end
