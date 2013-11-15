require "spec_helper"
require 'bisleri/parser'

describe Bisleri::Parser do
  describe ".parse_request" do
    context "when response line is valid" do
      it "should return a valid request object" do
        parser = Bisleri::Parser.new
        bare_minimum_valid_request = "GET / HTTP/1.1\r\nHost: www.test.com\r\n\r\n"
        request = parser.parse_request(bare_minimum_valid_request)
        expect(request.http_method).to eq("GET")
        request.resource_uri = "/"
        expect(request.http_version).to eq("HTTP/1.1")
        #expect(request.headers['Host']).to eq("www.test.com")
      end
    end
  end
end

