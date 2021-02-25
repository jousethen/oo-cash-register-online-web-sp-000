require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_item
  
  def initialize(discount=0)
    @total = 0.0
    @discount = discount
    @items = []
    
  end
  
  def add_item(title, price, quantity=1)
    transaction_total = 0.0
    quantity.times do
      @items << title
      @total += price
      transaction_total += price
    end
    @last_item = transaction_total;
  end
  
  def apply_discount
    if discount > 0
    
      discount = @discount.to_f / 100.00
      # binding.pry
      @total = @total - (@total * discount)
      
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_item
    @items.pop
  end
end
