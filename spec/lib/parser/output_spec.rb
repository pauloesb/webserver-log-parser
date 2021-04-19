# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Output do
  describe "#initialize" do
    context "when argument is not a Parser::Analyzer" do    
      it "raise exception" do
        expect { described_class.new(double) }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#print_log_analyzer" do
    let(:analyzer) { double(Parser::Analyzer) }
    let(:unique_result) do
      [
        ["/about/3", 4],
        ["/about/2", 3],
        ["/about", 1]
      ]
    end
    let(:result) do
      [
        ["/about/3", 14],
        ["/about/2", 30],
        ["/about", 10]
      ]
    end
    let(:log_analysis_result) do
      [
        "\n> list of webpages with most page views ordered:",
        "/about/3 14",
        "/about/2 30",
        "/about 10",
        "\n> list of webpages with most unique page views ordered:",
        "/about/3 4",
        "/about/2 3",
        "/about 1",
        "\n"
      ].join("\n")
    end

    subject { described_class.new(analyzer).result }

    before do
      allow(analyzer).to receive(:list_page_views_by_decreasing_order)
        .with(true).and_return(unique_result)
      allow(analyzer).to receive(:list_page_views_by_decreasing_order)
        .with(false).and_return(result)
      allow(analyzer).to receive(:is_a?).and_return(true)
    end

    it "return the log_analysis" do
      is_expected.to eq(log_analysis_result)
    end
  end
end
