class Triangle
  # write code here
  attr_accessor :lengthOne, :lengthTwo, :lengthThree

  def initialize(lengthOne, lengthTwo, lengthThree)
    @lengthOne = lengthOne
    @lengthTwo = lengthTwo
    @lengthThree = lengthThree
  end

  def kind
    if ((lengthOne && lengthTwo && lengthThree) <= 0) || (((lengthOne + lengthTwo) <= lengthThree) || ((lengthOne + lengthThree) <= lengthTwo) || ((lengthThree + lengthTwo) <= lengthOne))

      raise TriangleError
    else
      if (lengthOne == lengthTwo) && (lengthOne == lengthThree)
        return :equilateral
      elsif ((lengthOne == lengthTwo) && (lengthOne != lengthThree)) || ((lengthOne == lengthThree) && (lengthOne != lengthTwo)) || ((lengthThree == lengthTwo) && (lengthOne != lengthThree))
        return :isosceles
      else
        return :scalene
      end
    end
  end

  class TriangleError < StandardError

  end

end
