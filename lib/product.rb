class Product
  attr_accessor :price, :count

  def initialize(price = nil, count = nil)
    @price = price unless price == nil
    @count = count unless price == nil
  end
end