# Implement the Rolodex Class

# As a developer, I should implement the Rolodex class as an array that accepts new contacts.
# As a developer, the rolodex class should have the following methods: 
# => add, 
# => modify_contact, 
# => display_all_contacts, 
# => display_particular_contact, 
# => display_info_by_attribute 
# => delete_contact.

require_relative('contacts.rb')

class Rolodex

  attr_accessor :id
  attr_reader :contacts

  def initialize
    @id = 1
    @contacts = []
  end

  def add_contact(first_name, last_name, email, notes) 
    contact = Contact.new(@id, first_name, last_name, email, notes)
    @contacts << contact

    @id += 1
  end

  def find_contact(id) 
    @contacts.find do |c|
      c.id == id
    end
  end

  def modify_contact(id, attribute, new_attribute)
    contact = find_contact(id)

    case attribute
      when 1 then contact.first_name = new_attribute
      when 2 then contact.last_name = new_attribute
      when 3 then contact.email = new_attribute
      when 4 then contact.notes = new_attribute
    end
  end

  def display_contacts
    puts @contacts 
  end

  def display_single_contact(id)
    contact = find_contact(id)
    puts contact
  end

  def display_attribute(attribute)
    case attribute
      when 1 then 
        @contacts.each do |c|
          puts c.first_name
        end

      when 2 then
          @contacts.each do |c|
          puts c.last_name
        end
      when 3 then
          @contacts.each do |c|
          puts c.email
        end
      when 4 then
          @contacts.each do |c|
          puts c.notes
        end
    end
  end

  def delete_contact(id)
    contact = find_contact(id)
    @contacts.delete(contact)
  end

end