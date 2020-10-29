require 'pry'

class Triangle
  attr_accessor :equilateral, :isosceles, :scalene, :one, :two, :three
  
  def initialize( one, two, three )
    @one = one
    @two = two
    @three = three
  end

  def kind
    sides = [@one, @two, @three]
        # no size                         # negative numbers                # inequality rule
    if sides.all?{ |side| side == 0 } || sides.any?{ |side| side < 0 } || sides.sort[0] + sides.sort[1] <= sides.sort[2]
      raise TriangleError
    elsif sides.all?{ |side| side == @one }
      :equilateral
    elsif (sides[0] != sides[1] && sides[1] == sides[2] || sides[0] == sides[1] && sides[1] != sides[2] || sides[0] == sides[2] && sides[1] != sides[2])
      :isosceles
    elsif sides[0] != sides[1] && sides[1] != sides[2]
      :scalene
    end
  end

  class TriangleError < StandardError
  end
end
