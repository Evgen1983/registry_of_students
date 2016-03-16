class Subject < ActiveRecord::Base
  belongs_to :student
  validates_associated :student
  validates :semestr, :name, :grade, presence: true
  validates :semestr, numericality:  { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
  validates :grade, numericality:  { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }

end
