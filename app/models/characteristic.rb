class Characteristic < ActiveRecord::Base
  belongs_to :student
  validates_associated :student
end
