class User < ActiveRecord::Base
  include Slugable

  has_many :posts
  has_many :comments

  has_secure_password validations:false
  
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, on: :create, length: {minimum: 3}

  slugable_column :username

  def admin?
    self.role == 'Administrator'
  end
end