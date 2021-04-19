# frozen_string_literal: true

require "set"

module Parser
  class Analyzer
    attr_reader :data_input

    def initialize(data_input)
      @data_input = data_input
    end

    def list_page_views_by_decreasing_order(unique_views)
      data(unique_views).each_with_object({}) do |url_access, memo|
        url, = url_access
        memo[url] = 0 unless memo[url]
        memo[url] += 1
      end.sort_by(&by_access).reverse
    end

    private

    def data(unique)
      return Set.new(data_input) if unique

      data_input
    end

    def by_access
      ->(url_access) { Array(url_access).last }
    end
  end
end
