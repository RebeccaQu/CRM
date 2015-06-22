# Implement the Contact class

# As a developer, the contact class should have five attributes: id, first_name, last_name, email and notes.
# As a developer, when a user creates a contact, all five attributes are mandatory.
# As a developer, I am able to modify those attributes at any point in the program at a later time.
# As a developer, the Contact class should also have a method that displays all of its values.

class Contact
 
  attr_accessor :first_name, :last_name, :email, :notes
  attr_reader :id

  def initialize(id, first_name, last_name, email, notes)
    @id = id
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email 
    @notes = notes
  end

  def to_s
    "#{id}, #{first_name}, #{last_name}, #{email}, #{notes}"
  end

end