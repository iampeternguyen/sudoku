require 'colorize'

class Tile
  def initialize(value, was_given)
    @value = value
    @was_given = was_given
  end

  def to_s
    if @was_given
      return @value.to_s.colorize(:color => :blue)
    else
      return @value.to_s
    end
  end

  def change_value(value)
    @value = value unless @was_given
    @value

  end
end