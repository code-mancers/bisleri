require "bisleri/response_statuses"

module Bisleri
  class ResponseStatus
    attr_reader :status, :reason_phrase
    def initialize(status)
      @status = status.to_s
      @reason_phrase = RESPONSE_STATUSES[@status]
      #TODO: Use a proper Exception class
      raise "InvalidResponseStatus" if @reason_phrase.nil?
    end
  end
end