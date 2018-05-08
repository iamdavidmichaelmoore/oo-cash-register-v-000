require 'pry'


class CashRegister

  attr_accessor :total, :discount

  @@transaction = {}
  @@record = {}

  def initialize(discount=0)
    @total = 0
    self.discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    quant_price_ary = [quantity, price]
    calculate = price * quantity
    if @@transaction.empty? || !@@transaction.key?(title)
      @@transaction[title] = quant_price_ary
      quantity.times {@items << title}
      @@record[title] = quant_price_ary
      self.total += calculate
    elsif @@transaction.key?(title)
      @@transaction.each do |item, info|
        info[0] += quantity
        info[1] += price
      end
      quantity.times {@items << title}
      @@record[title] = quant_price_ary
      self.total += calculate
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

  def void_last_transaction
    @@transaction.each do |item, info|
      if item == @items.last
        info[0] -= @@

end
