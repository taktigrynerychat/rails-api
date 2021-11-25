class Geek < ApplicationRecord
  has_many :applies

  validates :name, :stack, presence: true, on: [:create, :update]
  validates :name, :stack, length: { maximum: 250 }
end
