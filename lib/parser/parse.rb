# frozen_string_literal: true

require_relative "input"
require_relative "analyzer"
require_relative "output"

module Parser
  class Parse
    def self.start(path)
      begin
        Parser::Input.new(path)
                    .then { |input| Parser::Analyzer.new(input.data) }
                    .then { |analyzer| Parser::Output.new(analyzer) }
                    .result
      rescue StandardError => e
        warn "Caught the exception: #{e.message}"
        exit(-1)
      end
    end
  end
end
