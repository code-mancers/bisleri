require "bisleri/request"
require "bisleri/errors"

module Bisleri

  class RequestBuilder
    attr_reader :request

    def initialize(raw_data)
      @raw_data = raw_data
      @request = Request.new
    end

    def set_request_line
      request_line_template = ["METHOD", "RESOURCE_URI", "HTTP_VERSION"]
      raw_request_line = @raw_data.split("\r\n")[0]
      request_line_array = raw_request_line.split(" ")
      raise if request_line_array.size != request_line_template.size
      @request.http_method = request_line_array[request_line_template.index("METHOD")]
      @request.resource_uri = request_line_array[request_line_template.index("RESOURCE_URI")]
      @request.http_version = request_line_array[request_line_template.index("HTTP_VERSION")]
    rescue
      raise Errors::InvalidRequestLine
    end
  end
end

