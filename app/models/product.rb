class Product < ActiveRecord::Base
  attr_accessible :description, :name, :price_in_cents
  attr_accessor :formatted_price

	validates :description, :name, :presence => true
	validates :price_in_cents, :numericality => {:only_integer => true }

  has_many :reviews
  has_many :users, :through => :reviews

	def formatted_price
		price_in_dollars = price_in_cents.to_f / 100
		f_price = sprintf('%.2f', price_in_dollars)
		return "$#{f_price}"

	end

end
