require './lib/bank'

RSpec.describe Bank do
  it 'Deposits 1 monetary unit and returns the balance.' do
    account1 = Bank.new
    account1.deposit(1, '17/04/2023')
    expect(account1.balance).to eq 1
  end

  it 'Deposits 1 monetary unit and returns the deposit balance and date.' do
    account1 = Bank.new
    transaction1 = account1.deposit(1, '17/04/2023')
    expect(transaction1).to eq ({'balance'=> 1, 'date'=> '17/04/2023'})
  end

  it 'Deposits 1000 monetary units and returns the deposit balance and date.' do
    account1 = Bank.new
    transaction1 = account1.deposit(1000, '18/04/2023')
    expect(transaction1).to eq ({'balance'=> 1000, 'date'=> '18/04/2023'})
  end

  it 'Deposits 50 and 1000 monetary units and returns the deposit balance and dates.' do
    account1 = Bank.new
    transaction1 = account1.deposit(50, '17/04/2023')
    expect(transaction1).to eq ({'balance'=> 50, 'date'=> '17/04/2023'})
    transaction2 = account1.deposit(1000, '18/04/2023')
    expect(transaction2).to eq ({'balance'=> 1050, 'date'=> '18/04/2023'})
  end

  it 'Returns error if depositing a negative value.' do
    account1 = Bank.new
    expect{ account1.deposit(-1000, '18/04/2023') }.to raise_error 'You cannot deposit negative values.'
  end

  it 'Returns error if depositing a zero value.' do
    account1 = Bank.new
    expect{ account1.deposit(0, '18/04/2023') }.to raise_error 'You cannot deposit negative values.'
  end

  it 'Returns error if amount deposited is not a number.' do
    account1 = Bank.new
    expect{ account1.deposit('aaaaa', '18/04/2023') }.to raise_error 'The deposit amount must not be a string.'
  end

  it 'Returns error if amount deposited is a number inserted as text.' do
    account1 = Bank.new
    expect{ account1.deposit('1', '18/04/2023') }.to raise_error 'The deposit amount must not be a string.'
  end

  it 'Withdraws 100 monetary units and returns updated balance.' do
    account1 = Bank.new
    account1.deposit(100, '17/04/2023')
    account1.withdraw(100, '19/04/2023')
    expect(account1.balance).to eq 0
  end

  it 'Deposits two amounts and withdraws once then returns updated balance.' do
    account1 = Bank.new
    account1.deposit(100, '17/04/2023')
    account1.deposit(2000, '18/04/2023')
    account1.withdraw(600, '19/04/2023')
    expect(account1.balance).to eq 1500
  end

  it 'Returns error when trying to withdraw more than the available balance.' do
    account1 = Bank.new
    account1.deposit(100, '17/04/2023')
    expect { account1.withdraw(101, '19/04/2023') }.to raise_error 'You cannot withdraw an amount greater than the available balance.'
  end

  it 'Returns zero when money withdrawn equal available balance.' do
    account1 = Bank.new
    account1.deposit(100, '17/04/2023')
    account1.withdraw(100, '19/04/2023')
    expect(account1.balance).to eq 0
  end
end