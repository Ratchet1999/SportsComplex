class Batch < ApplicationRecord
  belongs_to :sport
  belongs_to :branch

  has_many :coachings
end
