class Branch < ApplicationRecord
  has_many :batches
  has_many :sports, ->{ distinct }, through: :batches
end
