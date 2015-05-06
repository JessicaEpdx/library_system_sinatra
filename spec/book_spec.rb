require('spec_helper')

describe(Book) do

  describe('.all') do
    it("returns all books in database") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book.save()
      expect(Book.all).to(eq([test_book]))
  end
end

  describe('#title') do
    it("returns tile of a book") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book.save()
      expect(test_book.title()).to(eq("Going Up"))
    end
  end

  describe('#author') do
    it("returns author of a book") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book.save()
      expect(test_book.author()).to(eq("Shel Silverstein"))
    end
  end

  describe('#id') do
    it("returns id of a book") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book.save()
      expect(test_book.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#==') do
    it("is equal if book has the same author and title") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book2 = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book.save()
      test_book2.save()
      expect(test_book).to(eq(test_book2))
    end
  end

  describe('.find') do
    it("will return a book by book id") do
      test_book = Book.new({:title => "Going Up", :author => "Shel Silverstein", :id => nil})
      test_book2 = Book.new({:title => "Pirate Book", :author => "Shel Pirate", :id => nil})
      test_book.save()
      test_book2.save()
      expect(Book.find(test_book2.id)).to(eq([test_book2]))
    end
  end

end
