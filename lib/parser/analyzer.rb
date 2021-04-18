# frozen_string_literal: true

module Parser
  class Analyzer
    attr_reader :input_data

    def initialize(input_data)
      @input_data = input_data
    end

    def list_page_views_by_decreasing_order(unique_views: false, &block)
      data(unique_views).reduce({}) do |memo, url_access|
        url, _ = url_access
        memo[url] = 0 unless memo[url]
        memo[url] += 1
        memo
      end.sort_by(&by_access).reverse
    end

    private

    def data(unique)
      return Set.new(input_data) if unique

      input_data
    end

    def by_access
      proc { |url_access| Array(url_access).last }
    end
  end
end