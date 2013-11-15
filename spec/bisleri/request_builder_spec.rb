require "spec_helper"
require "bisleri/request_builder"

describe Bisleri::RequestBuilder do
  describe "#set_request_line" do
    context "when request line is valid" do
      before(:each) do
        @request_builder = Bisleri::RequestBuilder.new("GET /index.html HTTP/1.1\r\nxx")
        @request_builder.set_request_line
      end
      it "should set http method" do
        @request_builder.request.http_method.should == "GET"
      end
      it "should set resource uri" do
        @request_builder.request.resource_uri.should == "/index.html"
      end
      it "should set http version" do
        @request_builder.request.http_version.should == "HTTP/1.1"
      end
    end
    context "when request line is invalid" do
      it "should raise InvalidRequestLine exception" do
        @request_builder = Bisleri::RequestBuilder.new("abcdefg")
        expect{ @request_builder.set_request_line }.to raise_error("InvalidRequestLine")
      end
    end
  end
end