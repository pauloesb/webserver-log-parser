RSpec.describe "Parser" do
  describe "Parser process" do
    let(:stdout) { spy(STDOUT) }
    
    before do
      ARGV[0] = "./data/webserver.log"
    end

    let!(:result) do
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
      expect(
        begin
          Parser::Input.new(ARGV[0])
                      .then { |input| Parser::Analyzer.new(input.data) }
                      .then { |analyzer| Parser::Output.new(analyzer) }
                      .result
        rescue StandardError => e
          warn "Caught the exception: #{e.message}"
          exit(-1)
        end
      ).to eq(result) 
    end
  end
end