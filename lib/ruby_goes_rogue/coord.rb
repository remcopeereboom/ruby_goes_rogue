module RubyGoesRogue
  # Describe a location on a grid.
  # Designed to be immutable.
  # @note It is possible to use the coord class with floating point numbers,
  #   however all RGR methods are implemented under the assumption that #x and
  #   #y return integers.
  #
  # @!attribute x [r]
  #   @return [Integer] the x coordinate
  # @!attribute y [r]
  #   @return [Integer] the y coordinate
  class Coord
    attr_reader :x, :y

    # Initialize a new coord with coordinates x and y.
    # @param x [Integer] the x coordinate.
    # @param y [Integer] the y coordinate.
    def initialize(x, y)
      @x = x
      @y = y
    end

    # Does other lie at the same coordinates?
    # @param other [Coord, <#x, #y>, Object] the other coordinate.
    # @return false if other does not respond to #x and #y.
    # @return false if the coordinates are different.
    # @return true if the coordinates are equal.
    def ==(other)
      @x == other.x && @y == other.y
    rescue NoMethodError
      false
    end

    # Translate the coord by a vector.
    # @param other [Coord] the coord is treated as if it were a vector.
    # @return [Coord] a new instance.
    def +(other)
      Coord.new(@x + other.x, @y + other.y)
    end

    # Translate the coord by a vector.
    # @param other [Coord] the coord is treated as if it were a vector.
    # @return [Coord] a new instance.
    def -(other)
      Coord.new(@x - other.x, @y - other.y)
    end

    # A String representation of the form p(x, y).
    # @return [String]
    def to_s
      "p(#{x}, #{y})"
    end

    # An Array representation of the form [x, y].
    # @return [Array<Integer>]
    def to_a
      [@x, @y]
    end
  end
end
