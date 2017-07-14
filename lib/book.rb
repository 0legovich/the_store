class Book < Product
  attr_accessor :params

  def initialize(params={})
    super
    @params < params
  end

  def to_s
    "Книга \"#{params[:title]}\", #{params[:style]}, автор - #{params[:author]}, #{params[:price]} руб. (осталось #{params[:count]})"
  end
end