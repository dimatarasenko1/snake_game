require 'gosu'

class ActionWindow
  def initialize(snakes, apple_coordinates, score, size, side_length)
    @score_text = Gosu::Font.new(25)
    @apple_x_off = apple_coordinates[0]
    @apple_y_off = apple_coordinates[1]
    @score = score
    @size = size
    @snakes = snakes
    @side_length = side_length
  end

  def draw
    draw_rect(@apple_x_off, @apple_y_off, @size, @size, Gosu::Color::RED)
    @snakes.each do |x_y_array|
      draw_rect(x_y_array[0], x_y_array[1], @size, @size, Gosu::Color::WHITE)
    end
    @score_text.draw_text(@score.to_s, @side_length - @score_text.text_width('1000', 1), 10, 1, 1, 1, Gosu::Color::YELLOW)
  end
end
