require "singleton"
require "bisleri/request_builder"

module Bisleri
  class Parser
    include Singleton

    def parse_request(raw_data)
      request_builder = RequestBuilder.new(raw_data)
      request_builder.set_request_line
      return request_builder.request
    end

  end
end

