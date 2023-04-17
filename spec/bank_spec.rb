require './lib/bank'

RSpec.describe Bank do
  it 'Deposits 1 monetary unit.' do
    account1 = Bank.new
    account1.deposit(1)
    expect(account1.balance).to eq 1
  end

end