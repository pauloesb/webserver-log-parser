# frozen_string_literal: true

module Parser
  class Input
    attr_reader :file_path

    def initialize(file_path)
      @file_path = file_path
    end

    def data
      parse(file_path)
    end

    private

    def parse(path)
      @parse ||= File.read(path)
    rescue Errno::ENOENT => e
      warn "Caught the exception: #{e}"
      exit(-1)
    end
  end
end
