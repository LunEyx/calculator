# frozen_string_literal: true

require 'strscan'

module Calculator
  class Lexer
    SAMPLE = {
      float: /(\d+(_?\d+)*)?\.\d+(_?\d+)*/,
      int:   /\d+(_?\d+)*/,
      op:    %r{[+\-*/%]},
      id:    /[a-z][a-zA-Z0-9]*/,
      const: /[A-Z]+/,
      error: /./
    }.freeze
    def lex(str)
      scanner = StringScanner.new(str)
      tokens = []

      scanner.scan(/\s+/)
      until (!tokens.empty? && tokens.last.nil?) || scanner.eos?
        scanner.scan(/\s+/)
        token = scan_token(scanner)
        tokens << token
      end

      return [nil] if !tokens.empty? && tokens.last.nil?
      tokens
    end

    def scan_token(scanner)
      SAMPLE.each do |type, regex|
        scan_result = scanner.scan(regex)
        type == :op && scan_result = scan_result&.to_sym
        return [type, scan_result] unless scan_result.nil?
      end
      nil
    end
  end
end

