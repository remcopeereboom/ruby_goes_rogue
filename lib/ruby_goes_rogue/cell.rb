module RubyGoesRogue
  # A cell is a console element. It acts as a wrapper for a glyph and its
  # fore and background colors.
  # Designed to be immutable.
  #
  # @example Creating a sprite with a sprite index
  #   Cell.new(64, Color::AMBER, Color::WHITE)
  # @example Creating a sprite from a string
  #   Cell.new('@', Color::AMBER, Color::WHITE)
  #
  # @!attribute glyph [r] the sprite index.
  #   @return [Integer]
  # @!attribute fore_color [r] the fore color of the sprite (typically the
  #   letter).
  #   @return [Color]
  # @!attribute back_color [r] the back color of the sprite (typically the
  #   "white space").
  #   @return [Color]
  class Cell
    attr_reader :glyph, :fore_color, :back_color

    # Initialize the cell.
    # @param glyph [String, Integer] the sprite index. This can also be a
    #   String in which case the index will be set to the ordinal value of
    #   the first character in the string.
    # @param fore_color [Color] the fore color of the sprite (typically the
    #   letter).
    # @param back_color [Color] the back color of the sprite (typically the
    #   "white space").
    def initialize(glyph, fore_color, back_color)
      @glyph = glyph.ord
      @fore_color = fore_color
      @back_color = back_color
    end

    # Are two cells the same?
    # @param other [Cell, Object]
    # @return [Boolean]
    def ==(other)
      @glyph == other.glyph &&
        @fore_color == other.fore_color &&
        @back_color == other.back_color
    rescue NoMethodError
      false
    end
  end
end
