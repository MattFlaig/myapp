class Post < ActiveRecord::Base
  include Voteable
  include Slugable

  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through: :post_categories

  validates :title, presence: true
  validates :url, presence: true
  validates :description, presence: true

  slugable_column :title
end