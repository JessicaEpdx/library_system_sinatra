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
  @books = Book.all()
  erb(:librarian)
end

post('/books/new') do
  title = params.fetch("title")
  author = params.fetch("author")
  Book.new({:title => title, :author => author, :id => nil}).save()
  @books = Book.all()
  erb(:librarian)
end
