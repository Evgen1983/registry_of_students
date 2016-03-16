class Student < ActiveRecord::Base
	before_save { self.email = email.downcase }
	has_many :subjects, dependent: :destroy
	has_one :characteristic, dependent: :destroy
	validates :first_name, :last_name, :learning_team, :birthday, :email, :ip_adress, presence: true
	validates :first_name, :last_name, :learning_team, length: { minimum: 2, maximum: 20 }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
	
end
