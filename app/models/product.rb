class Product < ApplicationRecord
  has_many :orders
  def self.search(search_term)
  	if Rails.env.development?
      @products = Product.where("name LIKE?", "%#{search_term}%")
    else
      @products = Product.where("name ilike?", "%#{search_term}%")
    end
  end
end

