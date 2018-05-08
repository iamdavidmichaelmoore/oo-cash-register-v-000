require 'pry'


class CashRegister

  attr_accessor :total, :discount

  @@transaction = {}
  #@@items = []

  def initialize(discount=0)
    @total = 0
    self.discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quant_price_ary = [quantity, price]
    calculate = price * quantity
    if @@transaction == {} || !@@transaction.key?(title)
      @@transaction[title] = quant_price_ary
      quantity.times {@items << title}
      self.total += calculate
    elsif @@transaction.key?(title)
      @@transaction.each do |item, info|
        info[0] += quantity
        info[1] += price
      end
      quantity.times {@items << title}
      self.total += calculate
      binding.pry
    end
  end

  def apply_discount
    disc_convert = discount * 0.01
    if discount != 0
      self.total -= (total * disc_convert)
      "After the discount, the total comes to $#{self.total.to_i}."
    elsif discount == 0
      "There is no discount to apply."
    end
  end

  def items
    @items
  end


end
