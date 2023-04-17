class Bank
    def initialize
        @balance = 0
    end

    def deposit(amount)
        return @balance += amount
    end

    def balance
        return @balance
    end
end