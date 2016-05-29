if __FILE__ == $PROGRAM_NAME
  puts File.expand_path('..', __FILE__)
  puts
  $LOAD_PATH.unshift File.expand_path('..', __FILE__)
end

require 'gosu'

require 'ruby_goes_rogue/version'
require 'ruby_goes_rogue/coord'
require 'ruby_goes_rogue/color'
require 'ruby_goes_rogue/cell'
require 'ruby_goes_rogue/rect'
require 'ruby_goes_rogue/console'
require 'ruby_goes_rogue/window'

# The RGR library namespace
module RubyGoesRogue
  GameWindow.new(640, 480).show
end
