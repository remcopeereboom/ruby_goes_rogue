#!/usr/bin/env ruby

require 'bundler/setup'
require 'ruby_goes_rogue'

module RubyGoesRogue
  width = 480
  height = 360
  fullscreen = false

  System.init_rgr(80, 25)

  System.on_draw = lambda do
    cell = Cell.new('@', Color::RED, Color::YELLOW)
    cell.draw(Coord.new(5, 5))
  end

  System.on_update = lambda do |dt|
    puts "FPS: #{1000 / dt}"
  end

  System.window.show
end
