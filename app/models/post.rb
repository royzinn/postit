class Post < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :post_categories
  	has_many :categories, through: :post_categories

	validates :url, :presence => true
	validates :title, :presence => true
	validates :description, :presence => true
	validates_format_of :url, :with => URI::regexp(%w(http https))


	
end