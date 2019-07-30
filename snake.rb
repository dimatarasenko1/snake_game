class Snake
  SIZE = 20
  attr_accessor :size, :color, :x_off, :y_off
  def initialize(x_off, y_off)
    @size = SIZE
    @color = Gosu::Color::WHITE
    @x_off = x_off # n. of pixels right from left side
    @y_off = y_off # n. of pixels down from top side
    @x_dir = 1
    @y_dir = 0
  end

  def turn_right
    if @x_dir.zero?
      @x_dir = 1
      @y_dir = 0
    end
    continue
  end

  def turn_left
    if @x_dir.zero?
      @x_dir = -1
      @y_dir = 0
    end
    continue
  end

  def turn_down
    if @y_dir.zero?
      @y_dir = 1
      @x_dir = 0
    end
    continue
  end

  def turn_up
    if @y_dir.zero?
      @y_dir = -1
      @x_dir = 0
    end
    continue
  end


  def continue
    @x_off += @x_dir * SIZE
    @y_off += @y_dir * SIZE
  end
end
