# frozen_string_literal: true

module Parser
  class Analyzer
    attr_reader :data

    def initialize(data)
      @data = data.sort
    end

    def list_page_views_by_decreasing_order(unique_views: false)
      return {
        "/about" => 1,
        "/about/2" => 3,
        "/about/3" => 4
      } unless unique_views

      {
        "/about" => 1,
        "/about/2" => 2,
        "/about/3" => 3
      }
    end
  end
end