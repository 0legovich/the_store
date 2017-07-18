class Cart
  attr_accessor :bought_items, :all_price, :all_count

  def initialize
    @bought_items = {}
    @all_price = 0
    @all_count = 0
  end

  #возвращаем аналогичный товар из корзины, который сейчас хотим купить, если он добавлялся в корзину ранее
  def item_in_cart(bought_items, item_to_cart)
    bought_items.select {|item| item.title == item_to_cart.title}.first
  end

  def update_cart(item_to_cart)
    @all_price += item_to_cart.price
    @all_count += item_to_cart.count
  end

  #добавляем товар в корзину
  # count специально отделено на случай если делать следующий функционал:
  # "пользователь сразу кладет в корзину N количество товара, а не по одному"
  def add_to_cart(item)
    item_to_cart = item.clone.update(count: 1)

    #вытягиваем символ - к какому классу товаров принадлежит заказываемый товар
    sym_item = item_to_cart.class.to_s.downcase.to_sym
    bought_items[sym_item] ||= []
    item_in_cart = item_in_cart(bought_items[sym_item], item_to_cart)

    if item_in_cart.nil?
      bought_items[sym_item] << item_to_cart
    else
      item_in_cart.count += item_to_cart.count
    end
    update_cart(item_to_cart)
    item_to_cart
  end

  def to_a
    @bought_items.map {|keys, items| items}.flatten!
  end

  def show_odered_products
    odered_products = ""
    to_a.each {|i| odered_products += "#{i}\n"}
    "\nВы заказали\nТоваров #{all_count} шт., на сумму #{all_price} руб.\n#{odered_products}"
  end
end