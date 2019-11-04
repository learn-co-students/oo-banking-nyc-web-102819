class BankAccount
    attr_reader :name
    attr_accessor :balance, :status

    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"

        @@all << self
    end

    
    def deposit(num)
        self.balance += num
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?      
      balance > 0 && status == "open"
    end

    def close_account
        self.status = "closed"
    end

end
