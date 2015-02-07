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
  attr_reader :side1, :side2, :side3
  def initialize(lengths)
    @side1 = lengths[:side1]
    @side2 = lengths[:side2]
    @side3 = lengths[:side3]

    if (!triangleIsPossible)
      puts "Triangle cannot be created!"
      puts "The sum of the lengths any two sides must be greater than length of the third."
      @side1 = 0
      @side2 = 0
      @side3 = 0
    end
  end

  def showSides
    puts "side1:#{side1}, side2:#{side2}, side3:#{side3}"
  end

  def perimiter
    @perimiter = side1 + side2 + side3
  end

  def area
    #Heron's formula
    p = perimiter
    @area = Math.sqrt(p*(p-side1)*(p-side2)*(p-side3))
  end

  def triangleIsPossible
    if (side1 + side2 <= side3)
      return false
    end
    if (side1 + side3 <= side2)
      return false
    end
    if (side2 + side3 <= side1)
      return false
    end
    return true
  end
end

t = Triangle.new(
  :side1 => 10,
  :side2 => 25,
  :side3 => 30)
t.showSides
puts t.perimiter
puts t.area
