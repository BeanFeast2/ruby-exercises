class Catalogue
  def initialize
    @products = []
  end

  def <<(product)
    @products << product
  end

  def cheapest
    cheapest_product = nil
    @products.each_with_index do |product, i|
      cheapest_product = product if i == 0
      cheapest_product = product if product.price < cheapest_product.price
    end
    if cheapest_product.nil?
      nil
    else
      cheapest_product.name
    end
  end
end
