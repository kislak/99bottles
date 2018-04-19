require 'erb'

# 99 Bottles song
class Bottles
  def song
    verses(99, 0)
  end

  def verses(from, to)
    from.downto(to).to_a.map { |number| verse(number) }.join("\n")
  end

  def verse(number)
    sufix = [0, 1, 2].include?(number) ? number : 'other'

    template_name = "lib/verse_#{sufix}.erb"

    template = File.open(template_name, 'rb', encoding: 'utf-8', &:read)
    ERB.new(template).result(binding)
  end
end
