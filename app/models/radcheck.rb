class Radcheck < ActiveRecord::Base
  self.table_name = "radcheck"
  #alias_attribute :attr, :attribute
  validates :username, presence: true
  validates :attr, presence: true
  validates :value, presence: true
end
