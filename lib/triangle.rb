class Triangle
  # write code here
  def initialize(a,b,c)
    @len1 = a
    @len2 = b
    @len3 = c
  end

  def kind
    if ![@len1, @len2, @len3].all? {|x| x > 0}
      raise TriangleError
    end
    if !(@len1 + @len2 > @len3) || !(@len2 + @len3 > @len1) || !(@len3 + @len1 > @len2)
      raise TriangleError
    end
    if @len1 == @len2 && @len1 == @len3
      :equilateral
    elsif @len1 == @len2 || @len2 == @len3 || @len1 == @len3
      :isosceles
    else
      :scalene
    end
  end

  class TriangleError < StandardError
  end

end

