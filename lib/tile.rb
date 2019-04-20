require 'colorize'

class Tile
  attr_reader :value

  def initialize(value, was_given=false)
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