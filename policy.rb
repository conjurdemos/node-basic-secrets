require 'securerandom'

security_admin = group('/security_admin')
secret_key = variable('/node_basic_secrets/secret_key')

secret_key.add_value SecureRandom.hex
secret_key.permit 'execute', security_admin