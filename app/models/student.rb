class Student < ActiveRecord::Base
	has_many :subjects, dependent: :destroy
	has_one :characteristic, dependent: :destroy
	
end
