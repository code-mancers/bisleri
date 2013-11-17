require "bisleri/errors"

module Bisleri
  class RequestLine

    attr_accessor :http_method, :resource_uri, :http_version

    def validate!
      unless @http_version && @resource_uri && @http_version
        raise Errors::InvalidRequestLine
      end
    end

  end
end