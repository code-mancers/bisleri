module Bisleri
  module Errors
    class BisleriError < StandardError; end
    class InvalidRequestLine < BisleriError; end
  end
end
