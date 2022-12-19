# frozen_string_literal: true

require 'rake'
require './self_signed_certificate'
require './server'
require './test_connection'

# Define the test task
task :test do
  # Create a self-signed self-signed-certificate-server
  cert = SelfSignedCertificate.new
  key = cert.key
  cert = cert.cert

  # Start the server
  server = Server.new(key, cert)
  server.start

  # Test the connection to the server and check the expiration date of the server self-signed-certificate-server
  uri = URI('http://localhost:8443/api/v1/certificate')
  test_connection = TestConnection.new(uri)
  puts test_connection.call
end
