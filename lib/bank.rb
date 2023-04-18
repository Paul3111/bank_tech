require 'date'

class Bank
    def initialize
        @balance = 0
    end

    def deposit(amount, date = Date.today, type = "credit") # Date is optional
        return fail 'The deposit amount must not be a string.' if amount.is_a? String
        return fail 'You cannot deposit negative values.' if amount <= 0
        @balance += amount
        return {'amount'=> amount, 'date'=> date, 'balance'=> @balance, 'type'=> 'credit'}
    end

    def withdraw(amount, date = Date.today, type = "debit") # Date is optional
        fail 'You cannot withdraw an amount greater than the available balance.' if amount > @balance
        @balance -= amount
        return {'amount'=> amount, 'date'=> date, 'balance'=> @balance, 'type'=> 'debit'}
    end

    def balance
        return @balance
    end
end
