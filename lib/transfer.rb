class Transfer

  attr_reader :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @@all.include?(self)
      @status = "rejected"
    else
      if valid? && sender.balance > amount
        sender.deposit(-amount);
        receiver.deposit(amount);
        @status = "complete"
      else
        @status = "rejected"
      end
    end
    @@all << self
    if @status == "rejected"
      "Transaction rejected. Please check your account balance."
    else
      @status
    end
  end

  def reverse_transfer
    if @@all.include?(self)
      sender.deposit(amount)
      receiver.deposit(-amount)
      @status = "reversed"
    end
  end

end
