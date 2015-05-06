require('spec_helper')

describe(Patron) do

  describe('.all') do
    it("returns all patrons in database") do
      test_patron = Patron.new({:name => "Bill", :id => nil})
      test_patron.save()
      expect(Patron.all).to(eq([test_patron]))
    end
  end


  end
