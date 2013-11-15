require "spec_helper"
require 'bisleri/parser'

describe Bisleri::Parser do
  describe ".parse_request" do
    context "when response line is valid" do
      it "should return a valid request object" do
        parser = Bisleri::Parser.instance
        bare_minimum_valid_request = "GET / HTTP/1.1\r\nHost: www.test.com\r\n\r\n"
        request = parser.parse_request(bare_minimum_valid_request)
        request.http_method.should == "GET"
        request.resource_uri = "/"
        request.http_version.should == "HTTP/1.1"
        #request.headers['Host'].should == "www.test.com"
      end
    end
  end
end

