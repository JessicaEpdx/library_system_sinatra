class Book
attr_reader(:title, :author, :id)

  def initialize (attributes)
    @title = attributes.fetch(:title)
    @author = attributes.fetch(:author)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO books (title, author) VALUES ('#{@title}', '#{@author}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all
    all_books = []
    returned_books = DB.exec("SELECT * FROM books;")
    returned_books.each do |book|
      title = book.fetch("title")
      author = book.fetch("author")
      id = book.fetch("id").to_i
      all_books.push(Book.new({:title => title, :author => author, :id => id}))
    end
    all_books
  end

  def == (other_book)
    self.author() == other_book.author() && self.title() == other_book.title()
  end


end
