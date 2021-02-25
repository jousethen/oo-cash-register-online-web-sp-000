require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items, :last_item
  
  def initialize(discount=0)
    @total = 0.0
    @discount = discount
    @items = []
    
  end
  
  def add_item(title, price, quantity=1)
    quantity.times do
      @items << title
      @total += price
      @last_item = price
    end
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
