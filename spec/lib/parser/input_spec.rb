require "spec_helper"

RSpec.describe Parser::Input do
  subject { described_class.new("./foobar.log") }
  let(:mock_log) { "/about 0.0.0.0\n/about/2 0.0.0.0\n" }

  describe "data" do
    let(:parsed_data) do
      "/about 0.0.0.0\n/about/2 0.0.0.0\n"
    end

    before do
      allow(File).to receive(:read).and_return(mock_log)
    end

    it "return log parsed" do
      expect(subject.data).to eq(parsed_data)
    end
  end
end