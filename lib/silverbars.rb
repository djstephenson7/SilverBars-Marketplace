# SilverBars class which handles the order board logic.
class SilverBars
  def initialize
    @history = []
    @orders = {}
  end

  def show
    @history
  end

  def add(id, quantity, price, type)
    @orders = { id: id, quantity: quantity, price: price, type: type }
    @history << @orders
    @orders = {}
  end

  def delete
    @history.pop
  end
end
