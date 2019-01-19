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
    @orders[:id] = id
    @orders[:quantity] = quantity
    @orders[:price] = price
    @orders[:type] = type
    @history << @orders
    @orders = {}
  end
end
