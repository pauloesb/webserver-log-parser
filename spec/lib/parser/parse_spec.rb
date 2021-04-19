# frozen_string_literal: true

require "spec_helper"

RSpec.describe Parser::Parse do
  subject { described_class.start(file_path) }

  describe "#start" do
    context "when is success" do
      let(:file_path) { "../data/webserver.log" }

      let(:result) do
        [
          "\n> list of webpages with most page views ordered:",
          "/about/2 90",
          "/contact 89",
          "/index 82",
          "/about 81",
          "/help_page/1 80",
          "/home 78",
          "\n> list of webpages with most unique page views ordered:",
          "/index 23",
          "/home 23",
          "/contact 23",
          "/help_page/1 23",
          "/about/2 22",
          "/about 21",
          "\n"
        ].join("\n")
      end

      it "expect to return" do
        is_expected.to eq(result)
      end
    end

    context "when it fails" do
      let(:file_path) { "./foobar.rb" }

      it "raise exception" do
        expect { subject }.to raise_error
      end
    end
  end
end