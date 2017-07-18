class Book < Product
  attr_accessor :style, :author

  def initialize(params={})
    super
    @title = params[:title]
    @style = params[:style]
    @author = params[:author]
  end

  def self.give_book_params(path_to_file)
    params = File.readlines(path_to_file)
    params = {
        title: params[0].chomp,
        style: params[1].chomp,
        author: params[2].chomp,
        price: params[3].chomp,
        count: params[4].chomp
    }
  end

  def self.from_file(path_to_file)
    Book.new(give_book_params(path_to_file))
  end

  def to_s
    "Книга \"#{title}\", #{style}, автор - #{author}, цена за ед.: #{price} руб. (количество: #{count})"
  end
end