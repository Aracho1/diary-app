require './lib/database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('diary_test')
else
  DatabaseConnection.setup('diary')
end