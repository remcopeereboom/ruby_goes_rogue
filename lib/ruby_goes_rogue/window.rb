module RubyGoesRogue
  # The top-level window.
  class GameWindow < Gosu::Window
    # Initialize a new window.
    # @param columns [Integer] the width of the console in cells.
    # @param rows [Integer] the height of the console in cells.
    # @param tileset [String] path to the tileset.
    def initialize(columns, rows, tileset)
      if columns < 1
        fail ArgumentError, "Invalid console width (#{columns} for 1+)."
      elsif rows < 1
        fail ArgumentError, "Invalid console height (#{rows} for 1+)."
      end

      @columns = columns
      @rows = rows
      @tileset = TileSet.new(tileset)

      super @columns * @tileset.tile_width, @rows * @tileset.tile_height
    end

    # Called on each draw call.
    # @return [void]
    def draw
    end

    # Called on each frame update.
    # @return [void]
    def update
    end

    # Called when a button was pressed.
    # This method is called before {#update}.
    # @return [void]
    def button_down(id)
      case id
      when Gosu::KbEscape
        close
      end
    end
  end
end
