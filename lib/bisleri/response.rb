require "bisleri/response_status"

module Bisleri

  class Response
    attr_accessor :status, :http_version, :status_line

    def initialize
      @http_version = "HTTP/1.1"
    end

    def set_status(status_code)
      @status = ResponseStatus.new(status_code)
    end

  end

end

