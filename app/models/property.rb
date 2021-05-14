class Property < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :likes, dependent: :destroy
end
