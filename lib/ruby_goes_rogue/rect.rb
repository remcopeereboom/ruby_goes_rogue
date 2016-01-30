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
        init_using_dimensions(*args)
      else
        init_using_ranges(*args)
      end
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
    # @return [Enumerator<:each>] if no block is given.
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

    # Do two rectangles have the same domain?
    # @param other [Rect, Object]
    # @return [false] if other has the wrong duck type.
    # @return [Boolean] if other is a Rect.
    def ==(other)
      xmin == other.xmin &&
        xmax == other.xmax &&
        ymin == other.ymin &&
        ymax == other.ymax
    rescue NoMethodError
      false
    end

    # Return a string representation of the form rc(x:xmin..xmax, y:ymin..ymax).
    # @return [String]
    def to_s
      "rc(x:#{xmin}..#{xmax}, y:#{ymin}..#{ymax})"
    end

    private

    def init_using_dimensions(width, height)
      if width < 0
        fail ArgumentError, "Rect must have non-negative width (#{width})."
      elsif height < 0
        fail ArgumentError, "Rect must have non-negative height (#{height})."
      end

      @xrange = 0...width
      @yrange = 0...height
    end

    def init_using_ranges(xrange, yrange)
      if xrange.min.nil? # nil if min > max
        fail ArgumentError, "Rect must have a valid x domain (#{xrange})."
      elsif yrange.min.nil? # nil if min > max
        fail ArgumentError, "Rect must have a valid y domain (#{yrange})."
      end

      @xrange = xrange
      @yrange = yrange
    end
  end
end
