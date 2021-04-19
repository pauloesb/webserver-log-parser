# frozen_string_literal: true

module Parser
  class Output
    attr_reader :analyzer

    def initialize(analyzer, output: $stdout)
      @analyzer = analyzer
      @output = output
    end

    def result
      log_analysis = [
        build_log_analysis(unique: false),
        build_log_analysis(unique: true),
        "\n"
      ].join("\n")

      @output.puts log_analysis

      log_analysis
    end

    private

    def result_title_message
      {
        true => "\n> list of webpages with most unique page views ordered:",
        false => "\n> list of webpages with most page views ordered:"
      }
    end

    def add_space
      ->(url_access) { url_access.join(" ") }
    end

    def build_log_analysis(unique:)
      [
        result_title_message[unique],
        analyzer.list_page_views_by_decreasing_order(unique).map(&add_space)
      ]
    end
  end
end
