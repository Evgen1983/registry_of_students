class Characteristic < ActiveRecord::Base
  belongs_to :student
  validates_associated :student
  validates :title, :content, presence: true, length: {minimum: 5}

end
