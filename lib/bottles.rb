require 'erb'

class Bottles
  def initialize
  end

  def verse(number)
    t = number
    t = 99 if number > 1

    template = File.open("lib/bottles_#{t}.txt.erb", 'rb', encoding: 'utf-8', &:read)
    ERB.new(template).result(binding)
  end
end