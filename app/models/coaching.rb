class Coaching < ApplicationRecord
  belongs_to :user
  belongs_to :batch

  before_create :check_time_clash
  before_create :check_batch_already_exists

  def check_time_clash
    if User.current_month_enrolled_batches(user)&.first&.batches&.any? { |batch| batch.batch_time.strftime('%H') == self.batch.batch_time.strftime('%H') } 
      errors.add(:base, 'Coaching time clash with another Coaching')
      throw :abort
    end
  end

  def check_batch_already_exists
    if User.current_month_enrolled_batches(user)&.first&.batches&.any? { |batch| batch.sport == self.batch.sport && batch.branch == self.batch.branch }
      errors.add(:base, 'Enrolled in other batch of same sport in same branch')
      throw :abort
    end
  end
end
