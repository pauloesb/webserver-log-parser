#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative "parser/input"
require_relative "parser/analyzer"
require_relative "parser/output"

begin
  Parser::Input.new(ARGV[0])
               .then { |input| Parser::Analyzer.new(input.data) }
               .then { |analyzer| Parser::Output.new(analyzer) }
               .result
rescue StandardError => e
  warn "Caught the exception: #{e.message}"
  exit(-1)
end
