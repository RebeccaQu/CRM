# Implement the CRM class 

# As a user, I am presented with a prompt to 'add', 'modify', 'display all', 'display contact', display attribute', 'delete' and 'exit'.
# As a user, if 'add' is selected, I am prompted to give my 'first name', 'last name', 'email' and 'notes'.
# As a user, if 'modify' is selected, I am prompted to enter an id for the contact to be modified.
# As a user, when an id is entered, I am prompted to type 'yes' or 'no' to confirm my selection.
# As a user, if 'yes' is typed, I am prompted to change 'firstname', 'lastname', 'email' or 'notes' by number. You shouldn't be able to change the 'id'.
# As a user, when an attribute is entered, I am prompted to enter a new value for the attribute.
# As a user, if 'no' is entered, I am returned back to the main menu.
# As a user, if 'display all' is selected, I am shown all of the contacts that exist with their 'id's.
# As a user, if 'display contact' is selected, I am prompted to enter an 'id' and then shown the corresponding contact.
# As a user, if 'display attribute' is selected, I am prompted to enter an attribute ('firstname', 'lastname', 'email', or 'notes') so that I can see all of the contacts according to that attribute.
# As a user, if 'delete' is selected, I am prompted to enter the 'id' of the contact to be deleted.
# As a user, if 'exit' is selected, I am exited out of the program and returned to the command line.

require_relative('rolodex.rb')

class CRM

  def initialize 
    @rolodex = Rolodex.new

    @rolodex.add_contact("Jeff", "Winger", "jeff@winger.com", "I love scotch and myself. I tolerate Greendale.")
    @rolodex.add_contact("Britta", "Perry", "britta@perry.com", "I'm a psych major! Words are my weapons!")
    @rolodex.add_contact("Abed", "Nadir", "abed@nadir.com", "We're really filling in some plot holes here")
    @rolodex.add_contact("Senor", "Chang", "senor@chang.com", "I'm out. I chang-ed my mind")
    @rolodex.add_contact("Pierce", "Hawthorn", "pierce@hawthorn.com", "You all thought I died, didn't you?")
  end

  def display_main_menu  
    puts "[1] Add Contact"
    puts "[2] Modify Contact"
    puts "[3] Display All Contacts"
    puts "[4] Display A Contact"
    puts "[5] Display Contact Attribute"
    puts "[6] Delete Contact"
    puts "[7] Exit"
  end

  def choose_option
    print "Choose an option: "
    choice = gets.chomp.to_i

    case choice
      when 1 then add_contact
      when 2 then modify_contact
      when 3 then display_all_contacts
      when 4 then display_single_contact
      when 5 then display_attribute
      when 6 then delete_contact
      when 7 then
        puts "Goodbye"
        exit  
      else puts "Invalid Option"
    end
  end

  def main_menu
    puts "Welcome to MY CRM!"

    while true
      display_main_menu

      choose_option
    end
  end

  def add_contact 
    puts "You are adding a new contact."

    print "First Name: "
    first_name = gets.chomp

    print "Last Name: "
    last_name = gets.chomp

    print "Email: "
    email = gets.chomp

    print "Notes: "
    notes = gets.chomp

    @rolodex.add_contact(first_name, last_name, email, notes)
  end

  def modify_contact
    puts "You are editing a contact."

    print "Enter contact ID: "
    id = gets.chomp.to_i

    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"

    print "Select option to modify: "
    attribute = gets.chomp.to_i

    print "Enter new value: "
    new_attribute = gets.chomp

    @rolodex.modify_contact(id, attribute, new_attribute)
  end

  def display_all_contacts 
    puts "Displaying All Contacts: "

    @rolodex.display_contacts
  end

  def display_single_contact  
    print "Which contact would you like to see? Enter contact ID: "
    id = gets.chomp.to_i

    @rolodex.display_single_contact(id)
  end

  def display_attribute
    puts "[1] First Name"
    puts "[2] Last Name"
    puts "[3] Email"
    puts "[4] Notes"

    print "Which attribute would you like to see for all contacts? "
    attribute = gets.chomp.to_i

    @rolodex.display_attribute(attribute)
  end

  def delete_contact
    print "Which contact would you like to delete? Enter contact ID: "
    id = gets.chomp.to_i

    @rolodex.delete_contact(id)
  end

end

run = CRM.new
run.main_menu
