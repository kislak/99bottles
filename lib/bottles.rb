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

  def verses(from, to)
    from.downto(to).to_a.map { |n| verse(n) }.join("\n")
  end

  def song
    verses(99, 0)
  end
end