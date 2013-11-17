require "spec_helper"
require "bisleri/request_builder"

describe Bisleri::RequestBuilder do
  let(:request_builder) { Bisleri::RequestBuilder.new }
  describe "#set_request_line" do
    it "should set the request line" do
      request_builder.set_request_line("request_line")
      expect(request_builder.request.request_line).to eql("request_line")
    end
  end
  describe "#set_headers" do
    it "should set the request headers" do
      request_builder.set_headers({key: "value"})
      expect(request_builder.request.headers).to eql({key: "value"})
    end
  end
end

