# frozen_string_literal: true

module Parser
  class Analyzer
    attr_reader :data

    def initialize(data)
      @data = data
    end

    def list_page_views_by_decreasing_order(unique_views: false)
      sorted_data(unique_views).reduce({}) do |memo, value|
        memo[value[0]] = 0 unless memo[value[0]]
        memo[value[0]] += 1
        memo
      end
    end

    private

    def sorted_data(unique)
      return Set.new(data).sort if unique

      data.sort
    end
  end
end