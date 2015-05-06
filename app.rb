require('sinatra')
require('sinatra/reloader')
require('./lib/book')
require('./lib/patron')
also_reload('lib/**/*.rb')
require('pg')

DB = PG.connect({:dbname => "library"})

get('/') do
  erb(:index)
end

get('/librarian') do
  erb(:librarian)
end
