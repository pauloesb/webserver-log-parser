require "spec_helper"

RSpec.describe Parser::Input do
  subject { described_class.new("./foobar.log") }
  let(:mock_log) { "/about 0.0.0.0\n/about/2 0.0.0.0\n" }

  describe "data" do
    context "when file exist" do
      let(:parsed_data) do
        [
          ["/about","0.0.0.0"],
          ["/about/2","0.0.0.0"]
        ]
      end

      before do
        allow(File).to receive(:read).and_return(mock_log)
      end

      it "return log parsed" do
        expect(subject.data).to match_array(parsed_data)
      end
    end

    context "when file does not exist" do
      it "raise exception" do
        expect { subject.data }.to raise_error
      end
    end
  end
end