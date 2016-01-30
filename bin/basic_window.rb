#!/usr/bin/env ruby

require 'bundler/setup'
require 'ruby_goes_rogue'

module RubyGoesRogue
  width = 480
  height = 360
  fullscreen = false

  System.init_rgr(80, 25)

  foo = Cell.new('@', Color::RED, Color::YELLOW)
  bar = Cell.new('X', Color::WHITE, Color::BLUE)

  console = Console.new(5, 7)
  console.fill(bar)

  System.on_draw = lambda do
    console.draw(Coord.new(3, 3))
    foo.draw(Coord.new(5, 5))
  end

  System.on_update = lambda do |dt|
    # puts "FPS: #{1000 / dt}"
  end

  System.window.show
end
