require "spec_helper"

RSpec.describe Parser::Input do
  subject { described_class.new("./foobar.log") }

  describe "data" do
    let(:parsed_data) do
      [
        ["/path","0.0.0.0"]
      ]
    end

    it "return log parsed" do
      expect(subject.data).to match_array(parsed_data)
    end
  end
end