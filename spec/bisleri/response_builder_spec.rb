require "spec_helper"
require "bisleri/response_builder"

describe Bisleri::ResponseBuilder do
  describe "#set_status_line" do
    context "when status is valid" do
      before(:each) do
        @response_builder = Bisleri::ResponseBuilder.new
      end
      it "should set the status line" do
        expected_status_line = "HTTP/1.1 401 Unauthorized"
        @response_builder.set_status_line("401")
        expect(@response_builder.response.status_line).to eq(expected_status_line)
      end
    end
    context "when request line is invalid" do
      it "should raise InvalidStatusLine exception" do
        @response_builder = Bisleri::ResponseBuilder.new
        expect { @response_builder.set_status_line("499") }.to raise_error(Bisleri::Errors::InvalidStatusLine)
      end
    end
  end
end

