module Bisleri

  class Request
    attr_accessor :http_method, :resource_uri, :http_version, :headers

    def initialize
      headers = {}
    end
  end

end