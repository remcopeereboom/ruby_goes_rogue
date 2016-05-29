module RubyGoesRogue
  Color = Gosu::Color

  # A wrapper to include a Gosu::Color into the RubyGoesRogue namespace.
  # It also includes a few helper methods.
  # @note be aware that Color.new takes the arguments in argb order. It is
  #   recommended to use the .rgba class constructor to make the argument
  #   order explicit.
  class Color
    # Return a string representation of the form rgba(r, g, b, a).
    # @return [String]
    def to_s
      "rgba(#{red}, #{green}, #{blue}, #{alpha})"
    end

    # Return an Array representation of the form [r, g, b, a].
    # @return [Array<Integer>]
    def to_a
      [red, green, blue, alpha]
    end

    # Return a Hash representation.
    # @return [Hash]
    def to_h
      {
        red: red,
        green: green,
        blue: blue,
        hue: hue,
        saturation: saturation,
        value: value
      }.freeze
    end
  end
end
