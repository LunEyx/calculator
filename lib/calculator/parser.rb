# frozen_string_literal: true

require_relative 'lexer'

module Calculator
  class Parser
    PRESEDENCE = {
      :'(' => 0,
      :+   => 1,
      :-   => 1,
      :*   => 2,
      :/   => 2,
      :%   => 2,
      :+@  => 3,
      :-@  => 3,
      :^   => 4
    }.freeze

    def initialize
      @lexer = Lexer.new
    end

    def parse(str)
      @tokens = @lexer.lex(str)
      infix_to_postfix
    end

    private

    def infix_to_postfix
      return [] if @tokens.empty?
      return nil if @tokens[0].nil?

      last = nil
      stack = []
      postfix = []

      @tokens.each do |type, value|
        case type
        when :int
          postfix << [type, value.to_i]
        when :float
          postfix << [type, value.to_f]
        when :op
          type, value = postfix_operator_token([type, value], last)
          return nil if PRESEDENCE[value].nil?
          stack.reverse_each do |op|
            break if PRESEDENCE[op[1]] < PRESEDENCE[value]
            break if PRESEDENCE[op[1]] == PRESEDENCE[value] && type == :unary

            postfix << stack.pop
          end
          stack << [type, value]
        when :bk
          case value
          when :'('
            stack << [type, value]
          when :')'
            stack.reverse_each do |op|
              break if op[1] == :'('

              postfix << stack.pop
            end
            stack.pop
          end
        end
        last = type
      end
      @tokens = postfix.concat(stack.reverse)
      @tokens if operator_validate
    end

    def postfix_operator_token(token, last)
      if last.nil? || last == :unary || last == :binary
        token[0] = :unary
        token[1] = (token[1].to_s + '@').to_sym
      else
        token[0] = :binary
      end
      token
    end

    def operator_validate
      counter = 0
      @tokens.each do |type, _|
        case type
        when :int, :float
          counter += 1
        when :binary
          counter -= 1
        when :unary
          counter
        else
          return false
        end
        return false if counter < 1
      end
      counter == 1
    end
  end
end

