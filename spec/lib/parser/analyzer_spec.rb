# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Analyzer do
  let(:instance) { described_class.new(data) }
  let(:data) do
    [
      ["/about", "0.0.0.0"],
      ["/about/2", "0.0.0.0"],
      ["/about/2", "0.0.0.0"],
      ["/about/2", "0.0.0.1"],
      ["/about/3", "0.0.0.0"],
      ["/about/3", "0.0.0.0"],
      ["/about/3", "0.0.0.1"],
      ["/about/3", "0.0.0.2"]
    ]
  end

  describe "#list_page_views_by_decreasing_order" do
    subject { instance.list_page_views_by_decreasing_order(unique) }

    context "not unique" do
      let(:unique) { false }
      let(:result) do
        [
          ["/about/3", 4],
          ["/about/2", 3],
          ["/about", 1]
        ]
      end

      it "return the result" do
        is_expected.to eq(result)
      end
    end

    context "unique" do
      let(:unique) { true }
      let(:result) do
        [
          ["/about/3", 3],
          ["/about/2", 2],
          ["/about", 1]
        ]
      end

      it "return the result" do
        is_expected.to eq(result)
      end
    end
  end
end
