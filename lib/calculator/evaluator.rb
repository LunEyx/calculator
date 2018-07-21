# frozen_string_literal: true

require_relative 'parser'

module Calculator
  class Evaluator
    attr_reader :result

    OPERATION = {
      :+  => ->(a, b) { a + b },
      :-  => ->(a, b) { a - b },
      :*  => ->(a, b) { a * b },
      :/  => ->(a, b) { a / b },
      :%  => ->(a, b) { a % b },
      :+@ => ->(a) { +a },
      :-@ => ->(a) { -a }
    }.freeze

    def initialize
      @result = 0
      @parser = Parser.new
    end

    def eval(str)
      postfix = @parser.parse(str)
      return nil if postfix.nil?
      return '' if postfix.empty?
      stack = []

      postfix.each do |type, value|
        case type
        when :int, :float
          stack << value.to_f
        when :unary
          r = stack.pop
          stack << OPERATION[value].call(r)
        when :binary
          r = stack.pop
          l = stack.pop
          stack << OPERATION[value].call(l, r)
        end
      end
      stack.last.is_a?(Float) && stack.last.to_s =~ /\d+\.0/ && stack[-1] = stack.last.to_i

      @result = stack.last
    end
  end
end

