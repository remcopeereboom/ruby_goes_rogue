module RubyGoesRogue
  # A rectangle in 2d discrete euclidean space.
  # Designed to be immutable.
  #
  # @!attribute xrange [r] the range of inclusive x coordinates.
  #   @return [Range<Integer>]
  # @!attribute yrange [r] the range of inclusive y coordinates.
  #   @return [Range<Integer>]
  class Rect
    attr_reader :xrange, :yrange

    # Initialize a rect to surround the given ranges.
    # @overload initialize(width, heihgt)
    #   @param width [Integer] the width of the rect.
    #   @param height [Integer] the height of the rect
    # @overload initialize(xrange, yrange)
    #   @param xrange [Range<Integer>] the range of inclusive x coordinates.
    #   @param yrange [Range<Integer>] the range of inclusive y coordinates.
    def initialize(*args)
      if args[0].is_a? Integer
        width, height = *args
        xrange = 0...width
        yrange = 0...height
      else
        xrange, yrange = *args
      end

      @xrange = xrange
      @yrange = yrange
    end

    # The width of the rectangle.
    # @return [Integer]
    def width
      xrange.size
    end

    # The height of the rectangle.
    # @return [Integer]
    def height
      yrange.size
    end

    # The smallest inclusive x-value.
    # @return [Integer]
    def xmin
      xrange.min
    end

    # The largest inclusive x-value.
    # @return [Integer]
    def xmax
      xrange.max
    end

    # The smallest inclusive y-value.
    # @return [Integer]
    def ymin
      yrange.min
    end

    # The largest inclusive y-value.
    # @return [Integer]
    def ymax
      yrange.max
    end

    # Return each coordinate in the rectangle.
    # @yieldparam [Coord]
    # @return [Enumerator] to the method if no block is given.
    # @return [self] if a block is given.
    def each
      return enum_for(:each) unless block_given?

      yrange.each do |y|
        xrange.each do |x|
          yield Coord.new(x, y)
        end
      end

      self
    end

    # Return a string representation of the form rc(x:xmin..xmax, y:ymin..ymax).
    # @return [String]
    def to_s
      "rc(x:#{xmin}..#{xmax}, y:#{ymin}..#{ymax})"
    end
  end
end
