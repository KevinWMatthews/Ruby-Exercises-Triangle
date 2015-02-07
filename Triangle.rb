=begin
Triangle class
Store:
  User is expected to provide:
    length of the three sides
  Class should provide:
    perimeter (sum of the sides)
    area
    angles
    ?three "heights", i.e. right-angle distance from each vertex to the base
=end

class Triangle
  attr_reader :sides
  def initialize(lengths)
    @sides = storeSides(lengths)
    if (!triangleIsPossible)
      puts "Triangle cannot be created!"
      puts "The sum of the lengths any two sides must be greater than length of the third."
      @sides = storeSides([0,0,0])
    end
  end

  def showSides
    puts "side1:#{sides.side1}, side2:#{sides.side2}, side3:#{sides.side3}"
  end

  def perimiter
    @perimiter = sides.side1 + sides.side2 + sides.side3
  end

  def area
    #Heron's formula
    p = perimiter
    @area = Math.sqrt(p*(p-sides.side1)*(p-sides.side2)*(p-sides.side3))
  end

  def triangleIsPossible
    if (sides.side1 + sides.side2 <= sides.side3)
      return false
    end
    if (sides.side1 + sides.side3 <= sides.side2)
      return false
    end
    if (sides.side2 + sides.side3 <= sides.side1)
      return false
    end
    return true
  end

  TriangleSides = Struct.new(:side1, :side2, :side3)
  def storeSides(lengths)
    TriangleSides.new(lengths[0], lengths[1], lengths[2])
  end
end

t = Triangle.new([10,25,30])
puts t.sides
t.showSides
puts t.perimiter
puts t.area
