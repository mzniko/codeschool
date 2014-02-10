class Analyze
  def initialize
    @param = ARGV.shift
  end

  def read_arg
    case @param
    when '-p'
      prefix_regex
    when '-s'
      suffix_regex
    else
     abort("usage: " + __FILE__ + " [-p | -s] < [filename]")
    end
  end

  def prefix_regex
    puts 'selected prefix_regex'
    #not implemented
  end

  def suffix_regex
    puts 'selected suffix_regex'
    #not implemented
  end

  def read_lines
    ARGF.each_line do |line|
      puts line
    end
  end
end

run = Analyze.new
run.read_arg
#run.read_lines
