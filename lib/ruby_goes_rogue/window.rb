module RubyGoesRogue
  # The top-level window.
  class GameWindow < Gosu::Window
    # Initialize a new window.
    # @param width [Integer] the width in PIXELS.
    # @param height [Integer] the height in PIXELS.
    def initialize(width, height, options = {})
      super width, height, options
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
