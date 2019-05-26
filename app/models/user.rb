class User < ApplicationRecord
  	has_many :user_tickets	
	has_many :tickets, :through => :user_tickets

	validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

	validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
  	validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/ , message: "assword must be between 8 to 12 alphanumeric characters"}

  	has_secure_password
  
	#attr_accessible :email, :password, :password_confirmation
  
	validates_uniqueness_of :email

end
