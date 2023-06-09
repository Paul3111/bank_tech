# frozen_string_literal: true

require './app'

RSpec.describe 'Statement integration.' do
  before(:each) do
    @client1 = Client.new('Paul', 'Lazar')
    @account1 = Bank.new
    @statement1 = Statement.new
  end

  it 'Deposits 50 monetary units and returns the transaction history.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(50, '17/04/2023'))
    expect(@statement1.view_statement).to include "17/04/2023 || 50.00 || || 50.00\n"
  end

  it 'Prints the statement header.' do
    @statement1 = Statement.new
    expect(@statement1.statement_header).to eq 'date || credit || debit || balance'
  end

  it 'Deposits twice and returns the transaction history with the dates.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(100, '17/04/2023'))
    @statement1.add_transaction(@account1.deposit(400, '18/04/2023'))
    expect(@statement1.view_statement).to include "18/04/2023 || 400.00 || || 500.00\n"
  end

  it 'Deposits three times and returns the transaction history with the dates.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(100, '17/04/2023'))
    @statement1.add_transaction(@account1.deposit(400, '18/04/2023'))
    @statement1.add_transaction(@account1.deposit(500, '19/04/2023'))
    expect(@statement1.view_statement).to include "balance\n19/04/2023 || 500.00"
  end

  it 'Deposits and withdraws 100 monetary units and returns the transaction history.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(50, '17/04/2023'))
    @statement1.add_transaction(@account1.withdraw(50, '21/04/2023'))
    expect(@statement1.view_statement).to include "21/04/2023 || || 50.00 || 0.00\n"
  end

  it 'Deposits twice, withdraws 300 monetary units and returns the transaction history.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(200, '17/04/2023'))
    @statement1.add_transaction(@account1.deposit(400, '19/04/2023'))
    @statement1.add_transaction(@account1.withdraw(300, '21/04/2023'))
    expect(@statement1.view_statement).to include "21/04/2023 || || 300.00 || 300.00\n"
  end

  it 'Deposits twice, withdraws 300.30 monetary units and returns the transaction history.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(200.50, '17/04/2023'))
    @statement1.add_transaction(@account1.deposit(400, '19/04/2023'))
    @statement1.add_transaction(@account1.withdraw(300.30, '21/04/2023'))
    expect(@statement1.view_statement).to include "21/04/2023 || || 300.30 || 300.20\n"
  end

  it 'Returns error when deposit input is a negative amount.' do
    @statement1.add_client_to_statement(@client1)
    expect { @statement1.add_transaction(@account1.deposit(-100, '17/04/2023')) }.to raise_error 'You cannot deposit negative values.'
  end

  it 'Adds two clients and adds a transaction for the second client.' do
    client2 = Client.new('Alex', 'Maher')
    @statement1.add_client_to_statement(client2)
    @statement1.add_transaction(@account1.deposit(50, '17/04/2023'))
    expect(@statement1.view_statement).to include 'Alex Maher'
  end

  it 'Fails when user tries to withdraw more than the available balance.' do
    @statement1.add_client_to_statement(@client1)
    @statement1.add_transaction(@account1.deposit(200, '17/04/2023'))
    @statement1.add_transaction(@account1.deposit(400, '19/04/2023'))
    expect { @statement1.add_transaction(@account1.withdraw(900, '21/04/2023')) }.to raise_error 'You cannot withdraw an amount greater than the available balance.'
  end

end