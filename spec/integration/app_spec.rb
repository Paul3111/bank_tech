require './app'

RSpec.describe 'Statement integration.' do
  it 'Deposits 1000 monetary units and returns the transaction history.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_client_to_statement(client1)
    statement1.add_transaction(account1.deposit(50, '17/04/2023'))
    #statement1.fetch_balance(account1.balance)
    expect(statement1.view_statement).to eq "Paul Lazar\ndate || credit || debit || balance\n17/04/2023 || 50.00 || || 50.00\n"
  end
  
  it 'Prints the statement header.' do
    statement1 = Statement.new
    expect(statement1.statement_header).to eq "date || credit || debit || balance"
  end

  xit 'Deposits twice and returns the transaction history with the dates.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_client_to_statement(client1)
    statement1.add_transaction(account1.deposit(100, '17/04/2023'))
    statement1.add_transaction(account1.deposit(400, '18/04/2023'))
    #statement1.fetch_balance(account1.balance)
    expect(statement1.view_statement).to eq "Paul Lazar\ndate || credit || debit || balance\n17/04/2023 || 100.00 || || 100.00\n18/04/2023 || 400.00 || || 500.00\n"
  end

  it 'Deposits three times and returns the transaction history with the dates.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_client_to_statement(client1)
    statement1.add_transaction(account1.deposit(100, '17/04/2023'))
    statement1.add_transaction(account1.deposit(400, '18/04/2023'))
    statement1.add_transaction(account1.deposit(500, '19/04/2023'))
    #ßstatement1.fetch_balance(account1.balance)
    expect(statement1.view_statement).to eq "Paul Lazar\ndate || credit || debit || balance\n17/04/2023 || 100.00 || || 100.00\n18/04/2023 || 400.00 || || 500.00\n19/04/2023 || 500.00 || || 1000.00\n"
  end

  it 'Deposits and withdraws 100 monetary units and returns the transaction history.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_client_to_statement(client1)
    statement1.add_transaction(account1.deposit(50, '17/04/2023'))
    statement1.add_transaction(account1.withdraw(50, '21/04/2023'))
    #statement1.fetch_balance(account1.balance)
    expect(statement1.view_statement).to eq "Paul Lazar\ndate || credit || debit || balance\n17/04/2023 || 50.00 || || 50.00\nn21/04/2023 || || 50.00 || 0.00\n"
  end
end