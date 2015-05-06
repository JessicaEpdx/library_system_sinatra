class Patron
  attr_reader(:name, :id)

  def initialize (attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def save
    result = DB.exec("INSERT INTO patrons (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.all
    all_patrons = []
    returned_patrons = DB.exec("SELECT * FROM patrons;")
    returned_patrons.each do |patron|
      name = patron.fetch("name")
      id = patron.fetch("id").to_i
      all_patrons.push(Patron.new({:name => name, :id => id}))
    end
    all_patrons
  end

  def == (other_patron)
    self.id() == other_patron.id()
  end

  def update (attributes)
    @name = attributes.fetch(:name, @name)
    @id = self.id()
    DB.exec("UPDATE patrons SET name = '#{@name}' WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patrons WHERE id = #{self.id()};")
    DB.exec("DELETE FROM checked_out WHERE patron_id = #{self.id()};")
  end

end
