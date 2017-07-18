require_relative 'lib/product'
require_relative 'lib/book'
require_relative 'lib/film'
require_relative 'lib/compact_disk'
require_relative 'lib/product_collection'
require_relative 'lib/cart'

puts "Здравствуйте, Вы попали в магазин"

products = ProductCollection.from_dir('./data')

#Параметры сортировки: from: :title, :price, :count | by: :acs, :desc
sort_products = products.sort({from: :price, by: :desc })
cart = Cart.new

choiсe = -1
until choiсe == 0
  puts "\nЧто хотите купить:"
  sort_products.each_with_index {|val, key| puts "#{key+1}. #{val}"}
  puts "0. Выход"

  choiсe = STDIN.gets.to_i
  break if choiсe == 0
  unless choiсe.between?(0, sort_products.size)
    puts "Введите пожалуйста номер товара."
    next
  end

  cart_item = cart.add_to_cart(sort_products[choiсe-1])

  sort_products[choiсe-1].count -= cart_item.count
  sort_products.select! { |product| product.count > 0 }

  puts cart.show_odered_products
end

puts "Итого:"
puts cart.show_odered_products