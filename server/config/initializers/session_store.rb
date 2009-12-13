# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_analytics-fu_session',
  :secret      => 'f09d4554eac1cdf5d88f9e1f17144580529767e3fd48c913a5a0e9eb95c8a1f472e86a35e59906d593ebf15b4a6259bc33590b10b7324431652bb3e04c61d776'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
