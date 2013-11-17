require "spec_helper"
require "bisleri/response_status"

describe Bisleri::ResponseStatus do
  describe "#new" do
    let(:response_status){ Bisleri::ResponseStatus.new(@status) }
    it "should set the status and reason phrase for Bad Request" do
      @status = 400
      expect(response_status.status).to eq("400")
      expect(response_status.reason_phrase).to eq("Bad Request")
    end
    it "should set the status and reason phrase for Success" do
      @status = 200
      expect(response_status.status).to eq("200")
      expect(response_status.reason_phrase).to eq("OK")
    end
    it "should set the status and reason phrase for Unauthorized" do
      @status = 401
      expect(response_status.status).to eq("401")
      expect(response_status.reason_phrase).to eq("Unauthorized")
    end
    it "should raise InvalidResponseStatus when status is invalid" do
      @status = 499
      expect{ response_status }.to raise_error(Bisleri::Errors::InvalidResponseStatus)
    end
  end
end

