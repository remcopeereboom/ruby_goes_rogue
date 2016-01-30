module RubyGoesRogue
  # Provide single global access to library wide routines.
  #
  # @!attribute default_tileset [r]
  #   @return [Tileset] the default tileset for drawing.
  # @!attribute window [r]
  #   @api private
  #   @return [Window]
  # @!attribute screen_rect [r]
  #   @return [Rect] the screen size in Cells.
  module System
    class << self
      attr_reader :default_tileset, :window, :screen_rect

      # Initialize the RGR library.
      # @param cols [Integer] the width of the screen in cells. Must be > 0.
      # @param rows [Integer] the height of the screen in cells. Must be > 0.
      # @param options [Hash] initialization options
      # @option options [Tileset] :tileset The default tileset for drawing.
      def init_rgr(cols, rows, options = {})
        tileset = options.fetch(:tileset, 'media/tileset.png')
        @default_tileset = Tileset.new(tileset)
        @window = MainWindow.new(cols * default_tileset.tile_width,
                                 rows * default_tileset.tile_height)
        @screen_rect = Rect.new(cols, rows)
      end

      # Set the method containing drawing routines.
      # @param arity_0 [Proc] a 0-argument proc.
      # @return [void]
      # @note The draw method may be called at any time independent of any
      #   calls to #on_update. Therefore, only draw the current state in
      #   #on_draw and in particular, avoid updates like advancing animations.
      def on_draw=(arity_0)
        window.on_draw = arity_0
      end

      # Set the method containing update routines.
      # @param arity_1 [Proc] a 1-argument proc. The proc will be called
      #   with the frame dt in miliseconds.
      # @note An update frame may (and in general will) differ in length
      #   from a draw frame
      # @return [void]
      def on_update=(arity_1)
        window.on_update = arity_1
      end
    end
  end
end
