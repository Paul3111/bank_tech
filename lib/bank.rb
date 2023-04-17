class Bank
    def initialize
        @balance = 0
    end

    def deposit(amount, date = Date.now) # Date is optional
        fail 'You cannot deposit negative values.' if amount <= 0 
        @balance += amount
        return {'balance'=> @balance, 'date'=> date}
    end

    def balance
        return @balance
    end
end