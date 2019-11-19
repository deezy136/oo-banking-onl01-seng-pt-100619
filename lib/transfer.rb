require 'pry'
class Transfer
  # your code here
  
  attr_accessor :sender, :receiver, :amount, :status
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver
    @status = "pending"
    @amount = amount
    end 
   
    def valid?
      if @sender.valid? && @receiver.valid? 
       return true 
     else 
         return false 
      end 
     end 
    
   
    def execute_transaction
      if @sender.valid? && !@receiver.valid? || !@sender.valid? && @receiver.valid?
        @status = "rejected"
      return "Transaction rejected. Please check your account balance."
      elsif 
      @sender.balance > @amount && @status == "pending" 
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end 
    end 
    
    def reverse_transfer
      
      if execute_transaction
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    else 
      nil 
    end 
    binding.pry 
    end 
    
    
    
    end 