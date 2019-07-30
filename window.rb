require 'gosu'
require_relative 'snake'
require_relative 'restart_screen'
require_relative 'main_menu'
require_relative 'action_window'

# can either be playing, main menu, restart menu

class Window < Gosu::Window
  def initialize
    @game_status = "main_menu"
    @main_snake = Snake.new(20, 20)
    @score = 0
    @snakes = []
    @snakes << [@main_snake.x_off, @main_snake.y_off]
    @side_length = @main_snake.size * 30
    super @side_length, @side_length, { update_interval: 100 }
    self.caption = 'Snake'
    update_apple_position
  end

  def eat_apple?
    @main_snake.x_off == @apple_x_off && @main_snake.y_off == @apple_y_off
  end

  def dead?
    walls_hit = @main_snake.x_off == -@main_snake.size || @main_snake.x_off == @side_length || @main_snake.y_off == -@main_snake.size || @main_snake.y_off == @side_length
    itself_hit = @snakes.last(@score + 1).uniq.length != @snakes.last(@score + 1).length
    walls_hit || itself_hit
  end


  def update_apple_position
    @apple_x_off = (1..@side_length - 20).to_a.reject { |x| (@main_snake.x_off..(@main_snake.x_off + @main_snake.size)).to_a.include?(x) || x % 20 != 0 }.sample
    @apple_y_off = (1..@side_length - 20).to_a.reject { |x| (@main_snake.y_off..(@main_snake.y_off + @main_snake.size)).to_a.include?(x) || x % 20 != 0 }.sample
  end

  def get_high_scores(last_score)

  end

  def update
    case @game_status
    when 'restart'
      Window.close! if Gosu.button_down?(Gosu::KB_E)
      @game_status = "active" if Gosu.button_down?(Gosu::KB_R)
    when 'main_menu'
      if Gosu.button_down?(Gosu::KB_E)
        @game_status = "active"
        # update_apple_position
        # @main_snake = Snake.new(20, 20)
        # @snakes = []
      end
    when 'active'
      if Gosu.button_down? Gosu::KB_LEFT
        @main_snake.turn_left
      elsif Gosu.button_down? Gosu::KB_RIGHT
        @main_snake.turn_right
      elsif Gosu.button_down? Gosu::KB_DOWN
        @main_snake.turn_down
      elsif Gosu.button_down? Gosu::KB_UP
        @main_snake.turn_up
      else
        @main_snake.continue
      end
      if eat_apple?
        update_apple_position
        @score += 1
      end
      if dead?
        @game_status = "restart"
        # SCORES << @score
      end
      @snakes << [@main_snake.x_off, @main_snake.y_off]
    end
  end

  def draw
    case @game_status
    when 'active'
      ActionWindow.new(@snakes.last(@score + 1), [@apple_x, @apple_y], @score, @main_snake.size, @side_length)
    when 'main_menu'
      MainMenu.new(@side_length, 10).draw # => side_length, high_score
    when 'restart'
      RestartScreen.new(@side_length, @score, 11).draw # => side_length, score, high_score
    end
  end
end
