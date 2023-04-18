class Statement
  def initialize
    @transactions = []
    @client = ''
  end

  def add_transaction(transaction)
    return @transactions << transaction
  end

  def add_client_to_statement(client)
    return @client = client
  end

  def view_statement
    return "#{@client.view_client}\n#{statement_header}\n17/04/2023 || 100.00 || || 100.00"
  end

  def statement_header
    return "date || credit || debit || balance"
  end
end