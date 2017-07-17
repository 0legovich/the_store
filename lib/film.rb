class Film < Product
  attr_accessor :title, :year, :director

  def initialize(params={})
    super
    @title = params[:title]
    @year = params[:year]
    @director = params[:director]
  end

  def self.give_film_params(path_to_file)
    params = File.readlines(path_to_file)
    params = {
        title: params[0].chomp,
        director: params[1].chomp,
        year: params[2].chomp,
        price: params[3].chomp,
        count: params[4].chomp
    }
  end

  def self.from_file(path_to_file)
    Film.new(give_film_params(path_to_file))
  end

  def to_s
    "Фильм \"#{title}\", #{year}, реж. #{director}, цена за ед.: #{price} руб. (количество: #{count})"
  end
end