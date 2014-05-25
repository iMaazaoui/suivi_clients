class User < ActiveRecord::Base

	has_secure_password

	EMAIL_REGEX = /\A[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}\Z/i

	validates :nom, :presence => true, :length => { :maximum => 50 }
	validates :prenom, :presence => true, :length => { :maximum => 25 }
	validates :email, :presence => true, :length => { :maximum => 100 }, :format => EMAIL_REGEX, :confirmation => true

	def nom_prenom
		"#{nom} #{prenom}"
	end

end
