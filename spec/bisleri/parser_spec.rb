require "spec_helper"
require 'bisleri/parser'

describe Bisleri::Parser do
  describe ".parse_request" do
    context "when response line is valid" do
      it "should return a valid request object" do
        parser = Bisleri::Parser.new
        bare_minimum_valid_request = "GET / HTTP/1.1\r\nHost: www.test.com\r\n\r\n"
        request = parser.parse_request(bare_minimum_valid_request)
        expect(request.request_line.http_method).to eq("GET")
        expect(request.request_line.resource_uri).to eq("/")
        expect(request.request_line.http_version).to eq("HTTP/1.1")
        expect(request.headers["Host"]).to eq("www.test.com")
      end
    end
    context "when response line is invalid" do
      it "should return a valid request object" do
        parser = Bisleri::Parser.new
        invalid_request = "GET HTTP/1.1\r\nHost: www.test.com\r\n\r\n"
        expect { parser.parse_request(invalid_request) }.to raise_error(Bisleri::Errors::InvalidRequestLine)
      end
    end
    context "when there are multiple request headers" do
      it "should return a valid request object" do
        parser = Bisleri::Parser.new
        request_data = <<EOS
GET / HTTP/1.1\r
Host: www.test.com\r
User-agent: Mozilla/3.0Gold\r
From: user@test.com\r
\r
EOS
        request = parser.parse_request(request_data)
        expect(request.request_line.http_method).to eq("GET")
        expect(request.request_line.resource_uri).to eq("/")
        expect(request.request_line.http_version).to eq("HTTP/1.1")
        expect(request.headers["Host"]).to eq("www.test.com")
        expect(request.headers["User-agent"]).to eq("Mozilla/3.0Gold")
        expect(request.headers["From"]).to eq("user@test.com")
      end
    end
  end
end

