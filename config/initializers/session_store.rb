# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_shorty_session',
  :secret      => '50efa485b389d52578713a5f347a852805cb7a42ef51a59aab3b1c57da83f82ef40f3f275dc95cfbb2d7967898dbc01299d28704ed8e1e1b73f82164fdfd07cc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
