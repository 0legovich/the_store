class Film < Product
  attr_accessor :params

  def initialize(params={})
    super
    @params < params
  end

  def to_s
    "Фильм \"#{params[:title]}\", #{params[:year]}, реж. #{params[:director]}, #{params[:price]} руб. (осталось #{params[:count]})"
  end
end