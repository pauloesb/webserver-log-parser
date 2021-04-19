# frozen_string_literal: true

module Parser
  class Input
    attr_reader :file_path

    WHITESPACE = " "
    NEW_LINE = "\n"
    DATA_REGEXP_VERIFIER = %r{^(/\w+)+(\s){1}(\d{1,3}\.{1}){3}(\d{1,3}){1}$}

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
        input_invalid(entry) unless data_valid?(entry)

        entry.split(WHITESPACE)
      end
    end

    def input_invalid(line)
      raise ArgumentError, "File input with invalid data format: #{line}"
    end

    def data_valid?(data)
      data.match? DATA_REGEXP_VERIFIER
    end
  end
end
