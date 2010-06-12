class Point < ActiveRecord::Base
  before_create :assign_time_if_empty

  def assign_time_if_empty
    self.moment = (Time.zone.now.to_f * 1000).to_i unless moment
  end
end
