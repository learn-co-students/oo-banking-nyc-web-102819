class Transfer
  attr_accessor :status
  attr_reader :amount, :sender, :receiver
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    self.valid? && @sender.balance >= amount && status == "pending" ? complete_transfer : reject_transfer
  end

  def complete_transfer
    @sender.balance -= amount
    @receiver.balance += amount
    self.status = "complete"
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

  def reverse_transfer
    self.status == "complete" ? reversed_transfer : false
  end

  def reversed_transfer
    @sender.balance += amount
    @receiver.balance -= amount
    self.status = "reversed"
  end
end
