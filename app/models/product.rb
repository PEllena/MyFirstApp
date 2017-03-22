class Product < ApplicationRecord
  has_many :orders

  has_many :comments
  
  validates :name, presence: true
  validates :description, presence: true
  validates :image_url, presence: true
  validates :colour, presence: true
  validates :price, numericality: { only_integer: true }

  def self.search(search_term)
  	if Rails.env.development?
      @products = Product.where("name LIKE?", "%#{search_term}%")
    else
      @products = Product.where("name ilike?", "%#{search_term}%")
    end
  end

  def highest_rating_comment
	  comments.rating_desc.first
	end

  def lowest_rating_comment
  	comments.rating_asc.first
	end

  def average_rating
    comments.average(:rating).to_f
  end

  # This method gets the number of views for a certain product
  def views
    $redis.get("product:#{id}")
  end

  # This method increments the number of views for a certain product
  def viewed!
    $redis.incr("product:#{id}")
  end
end

