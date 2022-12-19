# frozen_string_literal: true

require 'net/http'

class TestConnection
  def initialize(uri)
    @uri = uri
  end

  def call
    http = Net::HTTP.new(@uri.host, @uri.port)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    response = http.get(@uri.path)
    expiration_date = Time.parse(response.body.split(': ')[1])
    if Time.now < expiration_date
      puts 'Certificate is valid'
    else
      puts 'Certificate has expired'
    end
    response.body
  end
end
