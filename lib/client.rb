# frozen_string_literal: true

# Used to create a client
class Client
  def initialize(first_name, last_name)
    raise 'First and last name are mandatory' if first_name == '' || last_name == ''
    raise 'Names can only contain letters' if first_name =~ /\d/ || last_name =~ /\d/

    @first_name = first_name
    @last_name = last_name
  end

  def view_client
    "#{@first_name.capitalize} #{@last_name.capitalize}"
  end
end
