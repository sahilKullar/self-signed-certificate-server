# Self-Signed Certificate and Server
This code demonstrates how to create a self-signed certificate, start an HTTPS server using Ruby's WEBrick library, and validate the expiration date of the server's certificate. It includes a `TestConnection` class that makes a GET request to the server and returns the response body, as well as a `test` task that starts the server and tests the connection to it.

## Dependencies
* `openssl`: used to create the self-signed certificate
* `webrick`: used to start the HTTPS server
* `net/http`: used to test the connection to the server and retrieve the response body
* `rake`: used to define the `test` task

## Code Overview

### SelfSignedCertificate
This class creates a self-signed certificate using the `openssl` library. It generates an RSA key and a certificate object, and sets the certificate's subject, issuer, public key, and expiration date.

### Server
This class starts an HTTPS server using the `webrick` library. It takes in a key and a certificate, and sets them as the server's SSL private key and certificate. It also mounts a proc that returns the expiration date of the certificate when a request is made to the root path.

### TestConnection
This class makes a GET request to a specified URI using the `net/http` library, parses the expiration date from the response body, and compares it to the current time to determine if the certificate is valid. It also returns the response body.

### `test` task in Rakefile
The `test` task creates a self-signed certificate, starts the server using the certificate, and tests the connection to the server by making a request to it and printing out the response body. It also uses the `TestConnection` class to validate the expiration date of the server's certificate.

## Usage
To run the `test` task and start the server, run `rake test` in the terminal. The server will start listening on port 8443, and the expiration date of the server's certificate will be printed out. The `TestConnection` class will also validate the expiration date and print either "Certificate is valid" or "Certificate has expired". To stop the server, press `CTRL+C` in the terminal.