# This Add Post In Blog
class Post < ActiveRecord::Base
  belongs_to :category
  has_many :comments, dependent: :destroy

  validates :title, presence: true, length: { minimum: 5 }
  validates :body, :image,  presence: true
  has_attached_file :image, styles: { medium: '300x300>', thumb: '100x100>' }
  validates_attachment_content_type :image, content_type: %r{\Aimage/.*\z}
end
