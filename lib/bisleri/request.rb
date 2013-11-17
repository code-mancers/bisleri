module Bisleri

  class Request
    attr_accessor :request_line, :headers, :body

    def initialize
      @headers = {}
    end
  end

end

