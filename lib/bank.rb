require 'date'

class Bank
    def initialize
        @balance = 0
    end

    def deposit(amount, date = Date.today) # Date is optional
        return fail 'The deposit amount must not be a string.' if amount.is_a? String
        return fail 'You cannot deposit negative values.' if amount <= 0
        @balance += amount
        return {'balance'=> @balance, 'date'=> date}
    end

    def withdraw(amount, date = Date.today) # Date is optional
        fail 'You cannot withdraw an amount greater than the available balance.' if amount > @balance
        @balance -= amount
        return {'balance'=> @balance, 'date'=> date}
    end

    def balance
        return @balance
    end
end