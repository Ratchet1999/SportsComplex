class User < ApplicationRecord
  has_many :coachings
  has_many :batches, through: :coachings

  validates :name, presence: true

  scope :current_month_enrolled_batches, ->(user){ joins(:batches).where("EXTRACT(MONTH FROM batch_time) = ? ", Time.current.strftime("%m")).where(id: user) }
end
