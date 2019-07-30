require 'gosu'

class MainMenu
  def initialize(side_length, high_score)
    @welcome_msg = Gosu::Font.new(50)
    @current_high_score_msg = Gosu::Font.new(40)
    @begin_msg = Gosu::Font.new(40)
    @welcome_string = "WELCOME TO --- SNAKE!!"
    @current_high_score_string = "The current high score: #{high_score}"
    @begin_string = "To Begin -- [ENTER]"
    padding = 10
    total_height = @welcome_msg.height + @current_high_score_msg.height + @begin_msg.height
    @x = (side_length - @welcome_msg.text_width(@welcome_string, 1)) / 2
    @welcome_msg_y = side_length / 2 - (total_height / 2)
    @current_high_score_msg_y = @welcome_msg_y + @welcome_msg.height + padding
    @begin_msg_y = @current_high_score_msg_y + @current_high_score_msg.height + padding
  end

  def draw
    @welcome_msg.draw_text(@welcome_string, @x, @welcome_msg_y, 1, 1, 1, Gosu::Color::YELLOW)
    @current_high_score_msg.draw_text(@current_high_score_string, @x, @current_high_score_msg_y, 1, 1, 1, Gosu::Color::YELLOW)
    @begin_msg.draw_text(@begin_string, @x, @begin_msg_y, 1, 1, 1, Gosu::Color::YELLOW)
  end
end
