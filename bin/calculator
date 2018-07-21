#!/usr/bin/env ruby

# frozen_string_literal: true

require 'readline'
require_relative '../lib/calculator/evaluator'

evaluator = Calculator::Evaluator.new

loop do
  buf = Readline.readline('> ', true)
  break if buf =~ /quit/ || buf =~ /exit/
  result = evaluator.eval(buf)
  if result.nil?
    puts 'NaN'
  else
    puts result
  end
rescue Interrupt
  puts "Enter 'quit' or 'exit' to quit"
end

