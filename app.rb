# frozen_string_literal: true

# Used to print the statement and the updated balance
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
    @transactions << transaction
  end

  def add_client_to_statement(client)
    @client = client
  end

  def view_statement
    list = []
    @transactions.each do |item|
      if item['type'] == 'credit'
        list << format("%<date>s || %<amount>.2f || || %<balance>.2f\n", date: item['date'], amount: item['amount'], balance: item['balance'])
      else
        list << format("%<date>s || || %<amount>.2f || %<balance>.2f\n", date: item['date'], amount: item['amount'], balance: item['balance'])
      end
    end
    "#{@client.view_client}\n#{statement_header}\n#{list.join}"
  end

  def statement_header
    'date || credit || debit || balance'
  end
end
