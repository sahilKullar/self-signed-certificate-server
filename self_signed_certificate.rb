# frozen_string_literal: true

require 'openssl'

class SelfSignedCertificate
  attr_reader :key, :cert

  def initialize
    @key = OpenSSL::PKey::RSA.new(2048)
    name = OpenSSL::X509::Name.new([['CN', 'localhost', OpenSSL::ASN1::UTF8STRING]])
    @cert = OpenSSL::X509::Certificate.new
    @cert.version = 2
    @cert.serial = 0
    @cert.subject = name
    @cert.issuer = name
    @cert.public_key = @key.public_key
    @cert.not_before = Time.now
    @cert.not_after = Time.now + 365 * 24 * 60 * 60
  end
end
