require './lib/bank'

RSpec.describe Bank do
  it 'Deposits 1 monetary unit and returns the balance.' do
    account1 = Bank.new
    account1.deposit(1, '17/04/2023')
    expect(account1.balance).to eq 1
  end

  it 'Deposits 1 monetary unit and returns the deposit balance and date' do
    account1 = Bank.new
    transaction1 = account1.deposit(1, '17/04/2023')
    expect(transaction1).to eq ({'balance'=> 1, 'date'=> '17/04/2023'})
  end
end