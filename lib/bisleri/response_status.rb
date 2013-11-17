require "bisleri/response_statuses"
require "bisleri/errors"

module Bisleri
  class ResponseStatus
    attr_reader :status_code, :reason_phrase
    def initialize(status)
      @status_code = status.to_s
      @reason_phrase = RESPONSE_STATUSES[@status_code]
      raise Errors::InvalidResponseStatus if @reason_phrase.nil?
    end
  end
end

