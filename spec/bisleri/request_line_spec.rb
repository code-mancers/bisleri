require "spec_helper"
require "bisleri/request_line"

describe Bisleri::RequestLine do
  describe "#validate!" do
    let(:request_line){ Bisleri::RequestLine.new }
    context "when request line is valid" do
      it "should not raise any error" do
        request_line.http_method = "GET"
        request_line.resource_uri = "/"
        request_line.http_version = "HTTP/1.1"
        expect { request_line.validate! }.not_to raise_error
      end
    end
    context "when request line is invalid" do
      it "should raise InvalidRequestLine error" do
        expect { request_line.validate! }.to raise_error(Bisleri::Errors::InvalidRequestLine)
      end
    end
  end
end