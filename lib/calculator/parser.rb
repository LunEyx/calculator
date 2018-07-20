# frozen_string_literal: true

require_relative 'lexer'

module Calculator
  class Parser
    PRESEDENCE = {
      :+  => 1,
      :-  => 1,
      :*  => 2,
      :/  => 2,
      :%  => 2,
      :+@ => 3,
      :-@ => 3
    }.freeze

    def initialize
      @lexer = Lexer.new
    end

    def parse(str)
      @tokens = @lexer.lex(str)
      infix_to_postfix
    end

    def sexp(str)
      @tokens = @lexer.lex(str)
      return nil if infix_to_postfix.nil?
      return [] if @tokens.empty?

      stack = []

      @tokens.each do |type, value|
        case type
        when :int
          stack << [type, value]
        when :float
          stack << [type, value]
        when :unary
          r = stack.pop
          stack << [:unary, value, r]
        when :binary
          r = stack.pop
          l = stack.pop
          stack << [:binary, value, l, r]
        end
      end

      stack.last
    end

    private

    def infix_to_postfix
      return [] if @tokens.empty?
      return nil if @tokens[0].nil?

      last = nil
      stack = []
      postfix = []

      @tokens.each do |token|
        case token[0]
        when :int
          token[1] = token[1].to_i
          postfix << token
        when :float
          token[1] = token[1].to_f
          postfix << token
        when :op
          postfix_operator_token(token, last)
          return nil if PRESEDENCE[token[1]].nil?
          stack.reverse_each do |op|
            break if PRESEDENCE[op[1]] < PRESEDENCE[token[1]]
            break if PRESEDENCE[op[1]] == PRESEDENCE[token[1]] && token[0] == :unary

            postfix << stack.pop
          end
          stack << token
        end
        last = token[0]
      end
      @tokens = postfix.concat(stack.reverse)
      @tokens = validate ? @tokens : nil
    end

    def postfix_operator_token(token, last)
      if last.nil? || last == :unary || last == :binary
        token[0] = :unary
        token[1] = (token[1].to_s + '@').to_sym
      else
        token[0] = :binary
      end
    end

    def validate
      counter = 0
      @tokens.each do |type, _|
        case type
        when :int, :float
          counter += 1
        when :binary
          counter -= 1
        end
        return false if counter < 1
      end
      counter == 1
    end
  end
end

