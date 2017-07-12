Knock.setup do |config|

  config.token_audience = -> { Rails.application.secrets.auth0_client_id }
  config.token_signature_algorithm = 'RS256'
  config.token_secret_signature_key = -> { Rails.application.secrets.auth0_client_secret }

  pem_raw = Net::HTTP.get URI(Rails.application.secrets.auth0_rsa_domain)
  pem_keys = JSON.parse(pem_raw)
  config.token_public_key = OpenSSL::X509::Certificate.new(pem_keys[pem_keys.keys.first]).public_key

  ## Exception Class
  ## ---------------
  ##
  ## Configure the exception to be used when user cannot be found.
  ##
  ## Default:
  # config.not_found_exception_class_name = 'ActiveRecord::RecordNotFound'
end
