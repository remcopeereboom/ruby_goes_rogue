module RubyGoesRogue
  # This is the main window of the game. Most of the methods here are Gosu
  # specific. Prefer to use the RGR hooks instead of manually overriding
  # behaviour to reduce dependencies on Gosu.
  class MainWindow < Gosu::Window
    attr_writer :on_draw, :on_update

    # Initialize the mainwindow.
    # @note If the requested window size does not fit the current display
    #   resolution, than coordinates will be scaled by Gosu to transparently
    #   emulate a larger window.
    #
    # @param width [Integer] the width in PIXELS.
    # @param height [Integer] the height of the window in PIXELS.
    # @param fullscreen [Boolean] start in fullscreen?
    def initialize(width, height, fullscreen = false)
      @on_draw = -> {}
      @on_update = -> (dt) {}
      super width, height, fullscreen
      @current_time = Time.now
    end

    # Called whenever a button is pressed. A button can be either a key or a
    #   mouse button.
    # @param button [Integer] a platform specific code.
    # @return [void]
    def button_down(button)
      close if button == Gosu::KbEscape
    end

    # Draw to the screen.
    # To add drawing behaviour, pass your a proc to System.on_draw=.
    # @return [void]
    # @see System.on_draw=
    def draw
      @on_draw.call
    end

    # Update the game state.
    # To add update behaviour, pass your a proc to System.on_update=.
    # #update will pass the proc the time elapsed since the previous fram in ms.
    # @return [void]
    # @see System.on_update=
    def update
      previous_time = @current_time
      @current_time = Time.now

      dt = (@current_time - previous_time).to_f * 1000
      @on_update.call(dt)
    end
  end
end
