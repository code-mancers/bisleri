require "bisleri/request_builder"
require "bisleri/request_line"

module Bisleri
  class Parser

    def parse_request(raw_data)
      @raw_data_lines = raw_data.split("\r\n")
      request_builder = RequestBuilder.new

      #Set request line
      request_line = parse_request_line
      request_builder.set_request_line(request_line)

      #Set request headers
      headers = parse_headers
      request_builder.set_headers(headers)

      return request_builder.request
    end

    private

      def parse_request_line
        request_line = RequestLine.new
        request_line_template = ["METHOD", "RESOURCE_URI", "HTTP_VERSION"]
        raw_request_line = @raw_data_lines[0]
        request_line_array = raw_request_line.split(" ")
        request_line.http_method = request_line_array[request_line_template.index("METHOD")]
        request_line.resource_uri = request_line_array[request_line_template.index("RESOURCE_URI")]
        request_line.http_version = request_line_array[request_line_template.index("HTTP_VERSION")]
        request_line.validate!
        return request_line
      end

      def parse_headers
        headers = {}
        @raw_data_lines[1..-1].to_a.each do |data_line|
          break if data_line == "\r\n"
          header_data = data_line.split(":")
          header_name = header_data[0].strip
          header_value = header_data[1].strip
          headers[header_name] = header_value
        end
        return headers
      end

  end
end

