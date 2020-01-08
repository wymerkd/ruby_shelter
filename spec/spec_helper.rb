require('rspec')
require('animal')
require('customer')
require('pg')
require('pry')
require('./config')

DB = PG.connect(TEST_DB_PARAMS)

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM customers *;")
    # DB.exec("DELETE FROM artists *;")
    # DB.exec("DELETE FROM albums_artists *;")
    # DB.exec("DELETE FROM sold_albums *;")
    # DB.exec("DELETE FROM songs *;")
  end
end
