require_relative './lib/product'
require_relative './lib/book'
require_relative './lib/film'

products = []

products << gem_book = Book.new(
    price: 350,
    count: 4,
    title: "Гем",
    style: "роман",
    author: "Эрих Мария Ремарк"
)
products << leon_film = Film.new(
    price: 220,
    count: 10,
    title: "Леон",
    year: "1994",
    director: "Люк Бессон"
)
products << eight_film = Film.new(
    price: 410,
    count: 1,
    title: "Омерзительная восьмерка",
    year: "2016",
    director: "Квентин Тарантино")

eight_film.price = 425
leon_film.update(price: 240, count: 7)

puts "Вот все что у нас есть:"
products.each { |product| puts product }