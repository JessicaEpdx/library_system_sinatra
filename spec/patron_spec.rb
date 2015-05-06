require('spec_helper')

describe(Patron) do

  describe('.all') do
    it("returns all patrons in database") do
      test_patron = Patron.new({:name => "Bill", :id => nil})
      test_patron.save()
      expect(Patron.all).to(eq([test_patron]))
    end
  end

  describe('#update') do
    it("allow user to update name") do
      test_patron = Patron.new({:name => "Bob", :id => nil})
      test_patron.save()
      test_patron.update({:name => "Sally"})
      expect(test_patron.name()).to(eq("Sally"))
    end
  end

  describe('#delete') do
    it("will delete a patron and all checked out books by that patron") do
      test_patron = Patron.new({:name => "Rebecca", :id => nil})
      test_patron.save()
      test_patron.delete()
      expect(Patron.all()).to(eq([]))
    end
  end

end
