module Bisleri
  module Errors
    class BisleriError < StandardError; end
    class InvalidRequestLine < BisleriError; end
    class InvalidResponseStatus < BisleriError; end
  end
end
