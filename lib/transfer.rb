class Transfer

  attr_accessor :balance, :status, :counter
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    if sender.valid? and receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? and sender.balance > amount and status == "pending"
      sender.balance -= @amount
      receiver.balance += @amount
      @status = "complete"
    else
      rejected_transaction
    end
  end

  def rejected_transaction
    @status = "rejected"
    return "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
