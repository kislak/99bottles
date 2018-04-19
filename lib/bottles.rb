require 'erb'

class Bottles
  def song
    verses(99, 0)
  end

  def verses(from, to)
    from.downto(to).to_a.map { |n| verse(n) }.join("\n")
  end

  def verse(number)
    template_name = (number > 2 ? 'lib/verse_other.erb' : "lib/verse_#{number}.erb")

    template = File.open(template_name, 'rb', encoding: 'utf-8', &:read)
    ERB.new(template).result(binding)
  end
end
