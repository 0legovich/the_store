class ProductCollection
  attr_accessor :all_product

  def initialize(params={})
    @all_product = params
  end

  def self.from_dir(data_path)
    paths = {films: data_path + '/films',
             books: data_path + '/books',
             disks: data_path + '/compact_disks'}
    if paths.select { |key, val| Dir.exist?(val) }.empty?
      raise "Не найдено ни одного каталога с продуктами"
    end

    ProductCollection.new({
        films: Dir[paths[:films] + '/*.txt'].map { |item| Film.from_file(item) },
        books: Dir[paths[:books] + '/*.txt'].map { |item| Book.from_file(item) },
        disks: Dir[paths[:disks] + '/*.txt'].map { |item| CompactDisk.from_file(item) }
                                       })
  end

  def to_a
    @all_product.map { |key, products| products }.flatten!
  end

   #сортируем товары по параметрам позиции (см комментарий app.rb, вызов метода sort)
  def sort(param={})
    collection = to_a.sort_by { |item| item.instance_variable_get('@' + param[:from].to_s) }
    param[:by] == :asc ? collection.reverse! : collection
  end
end