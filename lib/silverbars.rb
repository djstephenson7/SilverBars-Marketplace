# SilverBars class which handles the order board logic.
class SilverBars
  def initialize
    @buy_history = []
    @sell_history = []
    @order = {}
  end

  def show
    puts @buy_history.collect { |p| "#{p[:type]}: #{p[:quantity]}kg for £#{p[:price]} [user#{p[:id]}]" }
    puts @sell_history.collect { |p| "#{p[:type]}: #{p[:quantity]}kg for £#{p[:price]} [user#{p[:id]}]" }
  end

  def add(id, quantity, price, type)
    @order = { id: id, quantity: quantity, price: price, type: type }
    if @order.value? 'BUY'
      @buy_history << @order
    else
      @sell_history << @order
    end
    @order = {}
  end

  def delete_buy
    @buy_history.pop
  end

  def delete_sell
    @sell_history.pop
  end
end
