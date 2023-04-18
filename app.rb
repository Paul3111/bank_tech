class Statement
  def initialize
    @transactions = []
    @client = ''
    @balance = 0
  end

  def add_transaction(transaction)
    if transaction['type'] == 'credit'
        @balance += transaction['amount']
    else
        @balance -= transaction['amount']
    end
    return @transactions << transaction
  end

  def add_client_to_statement(client)
    return @client = client
  end

  def view_statement
    transactions_list = []
    @transactions.each do |transaction|
      if transaction['type'] == 'credit'
        transactions_list << "#{transaction["date"]} || #{sprintf('%.2f', transaction["amount"])} || || #{sprintf('%.2f', transaction['balance'])}\n"
      else
        transactions_list << "#{transaction["date"]} || || #{sprintf('%.2f', transaction["amount"])} || #{sprintf('%.2f', transaction['balance'])}\n"
      end
    end
    return "#{@client.view_client}\n#{statement_header}\n#{transactions_list.join()}"
  end

  def statement_header
    return "date || credit || debit || balance"
  end
end
