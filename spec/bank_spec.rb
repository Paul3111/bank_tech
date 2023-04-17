require './lib/bank'

RSpec.describe Bank do
  it 'Deposits 1 monetary unit and returns the balance.' do
    account1 = Bank.new
    account1.deposit(1, '17/04/2023')
    expect(account1.balance).to eq 1
  end

end