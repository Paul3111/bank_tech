class Bank
    def initialize
        @balance = 0
    end

    def deposit(amount, date = Date.now)
        @balance += amount
        return {'balance'=> @balance, 'date'=> date}
    end

    def balance
        return @balance
    end
end