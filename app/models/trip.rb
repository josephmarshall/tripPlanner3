class Trip < ApplicationRecord
  belongs_to :user
  has_many :locations, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
