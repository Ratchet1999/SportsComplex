class Sport < ApplicationRecord
  has_many :batches

  validates :name, presence: true
end
