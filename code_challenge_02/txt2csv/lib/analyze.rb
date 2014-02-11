require 'pp'

class Analyze
  attr_reader :regex_hash

  def initialize
    @param = ARGV.shift
    @text = STDIN
    @regex_hash = Hash.new(0)
  end

  def analyze
    case @param
    when '-p'
      @text.each_line { |line| prefix_regex(line) }
    when '-s'
      @text.each_line { |line| suffix_regex(line) }
    else
     abort("usage: " + __FILE__ + " [-p | -s] < [filename]")
    end
  end

  def prefix_regex(line)
    prefix = /^\w+/.match(line).to_s
    @regex_hash[:"#{prefix}"] += 1
  end

  def suffix_regex(line)
    suffix_array = line.scan(/(?!x)([a-z]+\.*)/i)
    suffix_array.flatten!
    suffix = suffix_array.last
    @regex_hash[:"#{suffix}"] += 1
  end
end

run = Analyze.new
run.analyze
pp run.regex_hash
