require './app'

RSpec.describe Statement do
  it 'Deposits 1000 monetary units and returns the transaction history.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_transaction(account1.deposit(100, '17/04/2023'))
    expect(statement1.view_statement).to eq 'date || credit || debit || balance\n17/04/2023 || 100.00 || || 100.00'
  end
  
  it 'Prints the statement header.' do
    statement1 = Statement.new
    expect(statement1.statement_header).to eq "date || credit || debit || balance"
  end

  xit 'Deposits twice and returns the transaction history with the dates.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    statement1 = Statement.new
    statement1.add_transaction(account1.deposit(100, '17/04/2023'))
    expect(account1.balance).to eq 100
    expect(client1.view_client).to eq 'Paul Lazar'
    expect(statement1.view_statement).to eq ''
  end
end