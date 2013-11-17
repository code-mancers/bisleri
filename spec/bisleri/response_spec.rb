require "spec_helper"
require "bisleri/response"

describe Bisleri::Response do
  describe "#set_status" do
    it "should set the ResponseStatus object" do
      response = Bisleri::Response.new
      response.set_status("401")
      expect(response.status.status_code).to eq("401")
      expect(response.status.reason_phrase).to eq("Unauthorized")
    end
  end
end

