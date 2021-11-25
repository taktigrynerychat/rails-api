class Apply < ApplicationRecord
  belongs_to :geek
  belongs_to :job

  validates :job_id, :geek_id, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
