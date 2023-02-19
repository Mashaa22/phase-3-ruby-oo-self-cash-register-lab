class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
      @last_transaction = nil
    end
  
    def add_item(item, price, quantity = 1)
      self.total += price * quantity
      quantity.times do
        items << item
      end
      self.last_transaction = { item: item, price: price, quantity: quantity }
    end
  
    def apply_discount
      if discount > 0
        self.total = total - (total * (discount.to_f / 100))
        "After the discount, the total comes to $#{'%.2f' % total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total -= last_transaction[:price] * last_transaction[:quantity]
      last_transaction[:quantity].times do
        items.pop
      end
      self.last_transaction = nil
    end
  end
