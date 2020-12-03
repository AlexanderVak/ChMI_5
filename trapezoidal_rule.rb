require 'dentaku'

class TrapezoidalRule
  attr_reader :result

  def initialize(func, wt0, wt_k, intervals)
    @wt0 = evaluate(wt0, nil).to_f
    @wt_k = evaluate(wt_k, nil).to_f
    @func = func
    @intervals = intervals.to_i
    @result = find_integral
  end

  def evaluate(expr, var)
    calculator = Dentaku::Calculator.new
    calculator.store(PI: Math::PI)
    calculator.evaluate(expr, wt: var)
  end

  def find_integral
    delta = (@wt_k - @wt0) / @intervals
    sum = 0.0

    (1..@intervals - 1).each do
      sum += evaluate(@func, @wt0).floor(1)
      @wt0 += delta
    end
    func_res = delta * (evaluate(@func, @wt0) + evaluate(@func, @wt_k) / 2 + sum.floor(1))
    p func_res.floor(1)
  end
end

def test
  func = '100 * SIN(wt)'
  wt0 = '0'
  wt_k = 'PI'
  intervals = '9'

  expression = TrapezoidalRule.new(func, wt0, wt_k, intervals)
  expression.result
end

puts 'Enter your formula :'
func = gets.chomp
puts 'Enter your wt0 :'
wt0 = gets.chomp
puts 'Enter yor wt_k :'
wt_k = gets.chomp
puts 'Enter number of intervals'
intervals = gets.chomp

expression = TrapezoidalRule.new(func, wt0, wt_k, intervals)
expression.result
