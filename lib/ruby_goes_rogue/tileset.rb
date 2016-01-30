module RubyGoesRogue
  # A tileset of a fixed size of 256 images that can be used to draw cells
  # (and consoles).
  #
  # @!attribute tile_width [r]
  #   @return [Integer] the width of a single tile in PIXELS.
  # @!attribute tile_height [r]
  #   @return [Integer] the height of a single tile in PIXELS.
  # @!attribute xscale [r]
  #   @return [Float] the horizontal scaling factor
  # @!attribute yscale [r]
  #   @return [Float] the vertical scaling factor
  class Tileset
    attr_reader :tile_width, :tile_height, :xscale, :yscale

    # Initialize a new tileset.
    # @param image [String] the filename to load from.
    # @param xscale [Float] the horizontal scaling factor.
    # @param yscale [Float] the vertical scaling factor.
    #
    # @note that the scaling factors are distinct from scaling factors applied
    #   when drawing. The final on_screen image will equal:
    #     `tileset.size * tilset.scaling * draw.scaling`.
    def initialize(image, xscale = 1.0, yscale = 1.0)
      cols = 16
      rows = 16

      @tiles = Gosu::Image.load_tiles(image, -cols, -rows, retro: true)
      if @tiles.empty?
        fail ArgumentError, "Failed to load tileset from image #{image}."
      end

      @xscale = xscale
      @yscale = yscale
      @tile_width = @tiles[0].width
      @tile_height = @tiles[0].height
    end

    def [](sprite_index)
      @tiles[sprite_index]
    end
  end
end
