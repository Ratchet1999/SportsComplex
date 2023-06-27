class User < ApplicationRecord
  has_many :coachings
  has_many :batches, through: :coachings

  validates :name, presence: true

  scope :current_month_enrolled_batches, ->(user){ joins(:batches).where("EXTRACT(MONTH FROM batch_time) = ? ", Time.current.strftime("%m")).where(id: user) }
  scope :enrolled_coachings_in_branch, ->(user, branch, start_time){ joins(coachings: [:sport, :branch]).where(id: user).where(branch: { id: branch }).where("EXTRACT(MONTH FROM start_time) = ? ",start_time.strftime("%m") ) }
end
