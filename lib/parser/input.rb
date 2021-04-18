# frozen_string_literal: true

module Parser
  class Input
    def initialize(file_path)
      @file_path = file_path
    end

    def data
      [
        ["/path","0.0.0.0"]
      ]     
    end
  end
end
