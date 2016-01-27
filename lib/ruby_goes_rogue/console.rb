module RubyGoesRogue
  class Console
    # The cell used when clearing consoles. This is also the cell used to fill
    # new consoles.
    # @return [Cell]
    def self.clear_cell
      @clear_cell ||= Cell.new(' ', Color::BLACK, Color::BLACK)
    end

    # Prevent ruby complaining about attribute_writers
    # rubocop:disable all

    # Set the cell to use when clearing consoles. This is also the cell used
    # to fill new consoles.
    # @param new_cell [Cell] the new clear cell.
    # @return [void]
    def self.clear_cell=(new_cell)
      @clear_cell = new_cell
    end
    # rubocop:enable all

    attr_reader :rect

    # Intialize a console of the given dimensions.
    # @param width [Integer] the width of the new console in cells.
    # @param height [Integer] the height of the new console in cells.
    def initialize(width, height)
      @rect = Rect.new(width, height)
      @width = width
      @cells = Array.new(width * height, Console.clear_cell)
    end

    # Return the cell at the coord.
    # @overload [](coord)
    #   @param coord [Coord]
    #   @return cell [Cell]
    # @overload [](x, y)
    #   @param x [Integer]
    #   @param y [Integer]
    #   @return cell [Cell]
    def [](*coord)
      if coord[0].is_a? Coord
        x, y = coord[0].to_a
      else
        x, y = coord
      end

      @cells[x + y * @width]
    end

    # Set the cell at the coord to new_cell.
    # @overload [](coord, new_cell)
    #   @param coord [Coord]
    #   @param new_cell [Cell]
    #   @return cell [Cell]
    #   @return [void]
    # @overload [](x, y, new_cell)
    #   @param x [Integer]
    #   @param y [Integer]
    #   @param new_cell [Cell]
    #   @return [void]
    def []=(*coord, new_cell)
      if coord[0].is_a? Coord
        x, y = coord[0].to_a
      else
        x, y = coord
      end

      @cells[x + y * @width] = new_cell
    end

    # Yield each cell in the console.
    # @yieldparam cell [Cell]
    # @return [Enumerator<:each>] if no block is given.
    # @return [self] if a block is given.
    def each
      return enum_for(:each) unless block_given?

      @rect.each { |c| yield self[c] }

      self
    end

    # Yield each coord in the console's domain.
    # @yieldparam coord [Coord]
    # @return [Enumerator<:each_coord>] if no block is given.
    # @return [self] if a block is given.
    def each_coord(&block)
      return enum_for(:each_coord) unless block_given?

      @rect.each(&block)

      self
    end

    # Yield each cell in the console's domain with its corresponding coord.
    # @yieldparam cell [Cell]
    # @yieldparam coord [Coord]
    # @return [Enumerator<:each_with_coord>] if no block is given.
    # @return [self] if a block is given.
    def each_with_coord
      return enum_for(:each_with_coord) unless block_given?

      @rect.each { |c| yield self[c], c }

      self
    end
  end
end
