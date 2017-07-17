class CompactDisk < Product
  attr_accessor :title, :musican, :type, :year
  def initialize(params={})
    super
    @title = params[:title]
    @musican = params[:musican]
    @type = params[:type]
    @year = params [:year]
  end

  def self.give_disk_params(path_to_file)
    params = File.readlines(path_to_file)
    params = {
        title: params[0].chomp,
        musican: params[1].chomp,
        type: params[2].chomp,
        year: params[3].chomp,
        price: params[4].chomp,
        count: params[5].chomp
    }
  end

  def self.from_file(path_to_file)
    CompactDisk.new(give_disk_params(path_to_file))
  end

  def to_s
    "Альбом #{musican} - #{title}, #{type}, #{year}, цена за ед.: #{price} руб. (количество: #{count})"
  end

end