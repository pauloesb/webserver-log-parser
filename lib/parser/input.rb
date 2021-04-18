# frozen_string_literal: true

module Parser
  class Input
    attr_reader :file_path

    WHITESPACE = " "
    NEW_LINE = "\n"

    def initialize(file_path)
      @file_path = file_path
    end

    def data
      normalize(parse(file_path))
    end

    private

    def parse(path)
      @parse ||= File.read(path)
    rescue Errno::ENOENT => e
      warn "Caught the exception: #{e}"
      exit(-1)
    end

    def normalize(data)
      @normalize ||= data.split(NEW_LINE).map do |entry|
        entry.split(WHITESPACE)
      end
    end
  end
end
