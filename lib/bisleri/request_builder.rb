require "bisleri/request"
require "bisleri/errors"

module Bisleri

  #TODO: This class can be removed if building a request
  #is as easy as calling the setter functions of the request object.
  class RequestBuilder
    attr_reader :request

    def initialize
      @request = Request.new
    end

    def set_request_line(request_line)
      request.request_line = request_line
    end

    def set_headers(headers)
      request.headers = headers
    end
  end
end

