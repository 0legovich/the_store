class Product
  attr_accessor :price, :count, :title

  def initialize(params={})
    @params = params
  end

  def update(update_params={})
    params.update(update_params)
  end
end