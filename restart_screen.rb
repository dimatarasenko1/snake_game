require 'gosu'

class RestartScreen
  def initialize(side_length, score, high_score)
    @game_over = Gosu::Font.new(50)
    @last_score = Gosu::Font.new(40)
    @high_score = Gosu::Font.new(40)
    @restart_msg = Gosu::Font.new(20)
    @game_over_string = "GAME OVER!"
    @last_score_string = "YOUR SCORE: #{score}"
    @high_score_string = "HIGH SCORE: #{high_score}"
    padding = 10
    total_height = @game_over.height + @last_score.height + @high_score.height
    @x = (side_length - @game_over.text_width(@game_over_string, 1)) / 2
    @game_over_y = side_length / 2 - (total_height / 2)
    @last_score_y = @game_over_y + @game_over.height + padding
    @high_score_y = @last_score_y + @last_score.height + padding
    @restart_string = "To restart game -- [R]\nTo exit game -- [E]"
    @restart_x = @x + @last_score.text_width(@game_over_string, 1) - @restart_msg.text_width(@game_over_string, 1)
    @restart_y = @game_over_y + total_height + @restart_msg.height + padding * 3
  end

  def draw
    @game_over.draw_text(@game_over_string, @x, @game_over_y, 1, 1, 1, Gosu::Color::YELLOW)
    @last_score.draw_text(@last_score_string, @x, @last_score_y, 1, 1, 1, Gosu::Color::YELLOW)
    @high_score.draw_text(@high_score_string, @x, @high_score_y, 1, 1, 1, Gosu::Color::YELLOW)
    @restart_msg.draw_text(@restart_string, @restart_x, @restart_y, 1, 1, 1, Gosu::Color::YELLOW)
  end
end
