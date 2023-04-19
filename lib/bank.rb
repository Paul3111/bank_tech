# frozen_string_literal: true

require 'date'

# Used to deposit, withdraw and return the updated balance
class Bank
  attr_reader :balance

  def initialize
    @balance = 0
  end

  def deposit(amount, date = Date.today, _type = 'credit')
    return raise 'The deposit amount must not be a string.' if amount.is_a? String
    return raise 'You cannot deposit negative values.' if amount <= 0

    @balance += amount

    { 'amount' => amount, 'date' => date, 'balance' => @balance, 'type' => 'credit' }
  end

  def withdraw(amount, date = Date.today, _type = 'debit')
    raise 'You cannot withdraw an amount greater than the available balance.' if amount > @balance

    @balance -= amount
    { 'amount' => amount, 'date' => date, 'balance' => @balance, 'type' => 'debit' }
  end
end
