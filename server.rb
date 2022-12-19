# frozen_string_literal: true

require 'webrick'

class Server
  def initialize(key, cert)
    @server = WEBrick::HTTPServer.new(
      Port: 8443,
      SSLEnable: true,
      SSLCertificate: cert,
      SSLPrivateKey: key
    )
    @server.mount_proc '/api/v1/certificate' do |_req, res|
      res['Content-Type'] = 'text/plain'
      res.body = "Certificate expiration date: #{cert.not_after}"
    end
    %w[INT TERM].each { |signal| trap(signal) { @server.shutdown } }
  end

  def start
    Thread.new do
      @server.start
    end
  end
end
