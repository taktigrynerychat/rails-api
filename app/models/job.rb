class Job < ApplicationRecord
  belongs_to :company
  has_many :applies

  validates :name, :place, :company_id, presence: true, on: [:create, :update]
  validates :name, :place, length: { maximum: 250 }
  validates :company_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
