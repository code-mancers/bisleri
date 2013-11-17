require "bisleri/response"
require "bisleri/errors"

module Bisleri
  class ResponseBuilder
    attr_reader :response

    def initialize
      @response = Response.new
    end

    def set_status_line(status)
      http_version = @response.http_version
      @response.set_status(status)
      status_code = @response.status.status_code
      reason_phrase = @response.status.reason_phrase
      @response.status_line = [http_version, status_code, reason_phrase].join(' ')
    rescue Exception => e
      raise Errors::InvalidStatusLine
    end
  end
end

