require_relative './lib/product'
require_relative './lib/book'
require_relative './lib/film'
require_relative './lib/compact_disk'
require_relative './lib/product_collection'
require_relative './lib/cart'

puts "Здравствуйте, Вы попали в магазин"

products = ProductCollection.from_dir('./data')

products.to_a.first.price = 425
products.to_a.last.update(price: 260, count: 7)
products.to_a.each { |product| product.update(title: 'Gem') if product.title == 'Гем' }

sort_products = products.sort({from: :price, by: :desc }) #from :title, :price, :count | by: :acs, :desc
cart = Cart.new

choise = -1
until choise == 0
  choise = -1
  puts "\nЧто хотите купить:"
  sort_products.each_with_index {|val, key| puts "#{key+1}. #{val}"}
  puts "0. Выход"

  choise = STDIN.gets.to_i until choise.between?(0, sort_products.size)
  break if choise == 0
  cart_item = cart.add_to_cart(sort_products[choise-1])

  sort_products[choise-1].count -= cart_item.count
  sort_products.select! { |product| product.count > 0 }
  puts "\nВы заказали\nТоваров #{cart.all_count} шт., на сумму #{cart.all_price} руб."
  puts cart.to_a
end

# choise = nil
# bought = []
# until choise == 0
#   puts "\nЧто хотите купить?\n"
#   sort_products.each_with_index {|val, key| puts "#{key+1}. #{val}"}
#   puts "0. Выход"
#
#   choise = STDIN.gets.to_i
#   puts "Вы выбрали:"
#   puts sort_products[choise-1]
#
#   sort_products.delete_at(choise-1)
#   bought << sort_products[choise-1]
# end
