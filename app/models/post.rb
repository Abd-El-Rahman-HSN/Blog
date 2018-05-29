class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  protect_from_forgery with: :exception
  validates :title, presence: true, length: { minimum: 5 }
  validates :body, presence: true
end
