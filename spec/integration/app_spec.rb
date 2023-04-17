require './app'

RSpec.describe Bank do
  it 'Deposits 1000 monetary unit and returns the transaction history.' do
    statement1 = Statement.new
    expect(statement1.view).to eq 'date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00'
  end
    
  xit 'Deposits 1 monetary unit and returns the transaction history.' do
    client1 = Client.new('Paul', 'Lazar')
    account1 = Bank.new
    account1.deposit(100, '17/04/2023')
    expect(account1.balance).to eq 100
    expect(client1.view_client).to eq 'Paul Lazar'
  end
end