class Product
  attr_accessor :price, :count, :title

  def initialize(params={})
    @price = params[:price].to_i
    @count = params[:count].to_i
  end

  #нельзя создать объект Product
  def self.from_file(path_to_file)
    raise NotImplementedError
  end

  # вытягиваем символ обновляемого параметра
  def sym_param_update(var)
    (var.to_s.delete("@")).to_sym
  end

  def update(update_params={})
    instance_variables.each do |var|
      sym_param = update_params[sym_param_update(var)]
      unless sym_param.nil?
        instance_variable_set(var, sym_param)
      end
    end
    self
  end
end