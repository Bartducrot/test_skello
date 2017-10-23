class Snap < ActiveRecord::Base
  belongs_to :post
  def delete_if_expired
    if self.created_at.to_time + self.duration - Time.now <= 0
      puts "this snap is expired"
      self.destroy
    else
      puts "this snap is not expired, it will be in #{(self.created_at.to_time + self.duration - Time.now).round} seconds"
    end
  end
end
