# frozen_string_literal: true

require 'strscan'

module Calculator
  class Lexer
    SAMPLE = {
      float: /(\d+(_?\d+)*)?\.\d+(_?\d+)*/,
      int:   /\d+(_?\d+)*/,
      op:    %r{[+\-*/%]},
      sp:    /\s+/,
      id:    /[a-z][a-zA-Z0-9]*/,
      const: /[A-Z]+/,
      error: /./
    }.freeze
    def lex(str)
      scanner = StringScanner.new(str)
      tokens = []

      tokens << scan_token(scanner) until scanner.eos?

      tokens
    end

    def scan_token(scanner)
      SAMPLE.each do |type, regex|
        scan_result = scanner.scan(regex)
        unless scan_result.nil?
          return token = [type, scan_result]
        end
      end
    end
  end
end

