class Triangle
  attr_accessor :sides

  def initialize(side_1, side_2, side_3)
    @sides = [side_1, side_2, side_3]
  end

  def each_side_larger_than_zero?
    @sides.all? { |side| side > 0 }
  end

  def equilateral?
    @sides[0] == @sides[1] && @sides[1] == @sides[2]
  end

  def indicies_satisfy_triangle_inequality?(idx_1, idx_2, idx_3)
    @sides[idx_1] + @sides[idx_2] > @sides[idx_3]
  end

  def isosceles?
    return false if self.equilateral?
    @sides[0] == @sides[1] || [@sides[0], @sides[1]].include?(@sides[2])
  end

  def kind
    if self.valid?
      return :equilateral if self.equilateral?
      return :isosceles if self.isosceles?
      return :scalene
    else
      raise TriangleError
    end
  end

  def satisfies_triangle_inequality?
    self.indicies_satisfy_triangle_inequality?(0, 1, 2) &&
      self.indicies_satisfy_triangle_inequality?(1, 2, 0) &&
      self.indicies_satisfy_triangle_inequality?(2, 0, 1)
  end

  def valid?
    self.each_side_larger_than_zero? && self.satisfies_triangle_inequality?
  end

  class TriangleError < StandardError
  end
end
