require "bisleri/response_statuses"
require "bisleri/errors"

module Bisleri
  class ResponseStatus
    attr_reader :status, :reason_phrase
    def initialize(status)
      @status = status.to_s
      @reason_phrase = RESPONSE_STATUSES[@status]
      raise Errors::InvalidResponseStatus if @reason_phrase.nil?
    end
  end
end

