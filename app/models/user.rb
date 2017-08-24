class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  validates_presence_of :contact_number
	validates_uniqueness_of :contact_number

  	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

end
