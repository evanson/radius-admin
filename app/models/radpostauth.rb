class Radpostauth < ActiveRecord::Base
  self.table_name = "radpostauth"

  def hour
    self.authdate.strftime('%H')
  end

  def self.today
    where('reply="Access-Accept" and authdate BETWEEN ? AND ?', "#{DateTime.now.beginning_of_day}", "#{DateTime.now.end_of_day}")
  end
end
