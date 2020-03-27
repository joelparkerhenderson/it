##
#
# Key Pair
#
# To create a key pair, you can use either the local command line,
# or the AWS console. We prefer to use the local command line,
# because the private information stays on our local system.
#
#
# ## To create a key pair via local command line
#
# Command:
#
#     ssh-keygen -t rsa -b 4096
# 
# We prefer to generate our keys via our tool `ssh-keygen-pro`:
#
#   * https://github.com/sixarm/ssh-keygen-pro
#
# The tool creates a name convention that helps with tracking.
#
#
# ## Why use the RSA algorithm?
#
# AWS key pairs currently (2020-03-25) must use the RSA algorithm,
# and cannot use any other algorithm such as DSA, ECDSA, Ed25519, etc.
#
# If you try to upload a non-RSA public key, then you will get an error.
#
# Example error message for a DSA key:
#
#     Amazon EC2 does not accept DSA keys. Make sure your 
#     key generator is set up to create RSA keys.
#
# Example error message for another algorithm key:
#
#     Error import KeyPair: InvalidKey.Format: 
#     Key is not in valid OpenSSH public key format
#
#
# ## To create a key pair via the AWS console
#
# To create a key pair via the the AWS console:
#
#   * Use the AWS console to create a key pair such as `administrator`.
#
#   * Download the key pair file such as `administrator.pem`.
#
# To convert a AWS *.pem file to the resource's public key format:
#
#     openssl rsa -in administrator.pem -pubout
#
# Example output:
#
#     -----BEGIN PUBLIC KEY-----
#     MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAp6hb0N8fI+EzfWDPibdr
#     ZWxkr+hV9tIiXOGqVxjRfyT9Ot/oSQ2UXWT/S1+YP4f8VVfsK8koH04/aW1jFV7X
#     0bUAOkt4C+EWWdBaWMnUDb7Y/urDfQKNg801m2GZji/iVqWvLRuEHeYHY3HGcHyC
#     A2wa6euHX++DIFEn079IkCPUKjLTy0uvZV0Xr6gQ0f8uPMycXgmsaUKUTrh0YUdq
#     2v7mKou1E0KDZhu9HQksHwPinWKMjxBHUCO34jNlVTMn5FpUaNtt/+Vqh0dQ4z6t
#     Vd4cVAHdqP7uM+zhsVadb9ulkbcPeqn6xYK38zwG5OpECvpeFQAgq45ZakCvFKAF
#     OwIDAQAB
#     -----END PUBLIC KEY-----
#
# If you get this error message:
#
#     Error import KeyPair: InvalidKey.Format: 
#     Key is not in valid OpenSSH public key format
#
# Edit the public key content (not the BEGIN line nor END line),
# and remove the newlines, then use that to set `public_key` below.
#
# Then import the key pair such as `administrator`:
#
#     terraform import aws_key_pair.administrator administrator
#
# Output:
#
#     aws_key_pair.administrator: Importing from ID "administrator"...
#     aws_key_pair.administrator: Import prepared!
#     Prepared aws_key_pair for import
#     aws_key_pair.administrator: Refreshing state... [id=administrator]
#     Import successful!
#
# We use this key pair for our default needs, such as SSH to an instance.
# Our public key below won't work for you, so you'll want to change it.
#
# To try using SSH, such as with a file `administrator.pem`, to a machine
# username `ubuntu`, on a machine with IP address `12.34.56.78`:
#
#     ssh -i administrator.pem ubuntu@12.34.56.78
#
# If you choose to generate your key pair locally, not using the AWS console,
# then we suggest you can use  the `openssh` command to create the public key. 
# Then you need to generate the correct format of the public key.
###

resource "aws_key_pair" "administrator" {
  key_name   = "administrator@joelparkerhenderson.com=98393eb0bbd83baa8eae3404da29978e"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQChsDTEXGTPtG1IpESzFbQEEbt/ecl9j5EhY0QYIl/+hl67Udsmv3X87NMjV1I4q5qTLc4kfXCWIRstCVjBtcYX4xaBtW8xHSMlldeplFkFVR4iaxPY4OcJJQGkcA6F0UM5Bnva4FwPCw/HFohqs4GwIy0kSKbt9JeFpn0v2i9x9V9x2QFDrxr7ceksYRGf6L9cMsowwIPPuWb2fTk3JYO1pQVoy6gXjIQuPTGkEjap4TYeu7zH7jlj4l22aWv056beo6noSNIzXr74+/Ho//7kOW+OadAozkIeZO4gyXk0ixwia0XELGSMwrfI43cxFRIYOCA5r5a7CUYYIvgGHGOhyYxrVdvSqulLIhkljij4UIELb9aw3F18PPjRySsyk4xzANFwZejH/FxOq4HztIiInFsk14D5D0WQZmW6WATC5eys6m1bSgC5ytXf5rDbYuQySn/5OfEwxj/r3EWWqLqDVzDDXZ6ik6FtwyZhWg/ej8jq4yRWm+D7SObIeG5lSLFcWIJR3A8QrzcA4ONJC/YEiuAwcuYiRVeVF1pUnuYw9+JWcrLNHDRq4IYl6oZAWwNCaaoMUqf1v0VtMxpOObQQwWDQLtyYCEOVuDFhvHBNEUhOisa9QsTAs4mbheclNT0SxKaTa+Ul0aCyAOyvh4RGaPDTiTxKB2S9R7+EjNCyiw=="
}
