class Client
  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name = last_name
  end

  def view_client
    return "#{@first_name.capitalize()} #{@last_name.capitalize()}"
  end
end
