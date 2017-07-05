class User < ApplicationRecord
  # Include default devise modules. Others available are:
  devise :database_authenticatable, :confirmable, :registerable, :recoverable,
         :rememberable, :trackable, :validatable, :omniauthable,
         :omniauth_providers => [:facebook, :github, :google]

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.email = auth.info.email
			user.password = Devise.friendly_token[0,20]
			user.name = auth.info.name
			# user.image = auth.info.image # assuming the user model has an image
			
			# user.skip_confirmation!
		end
	end
end
