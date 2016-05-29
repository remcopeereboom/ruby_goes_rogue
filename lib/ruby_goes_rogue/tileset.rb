module RubyGoesRogue
  # A tileset of images.
  #
  # @!attribute [r] tile_width
  #   @return [Integer] the width of a tile in PIXELS.
  # @!attribute [r] tile_height
  #   @return [Integer] the height of a tile in PIXELS.
  class TileSet
    attr_reader :tile_width, :tile_height

    # Creates a new tileset from the specified image.
    # The image will be subdivided into 16 x 16 evenly sized tiles.
    # @param path [String] path to an image.
    def initialize(path)
      @tiles = Gosu::Image.load_tiles(path, -16, -16)
      @tile_width = @tiles[0].width
      @tile_height = @tiles[0].height
    end
  end
end
