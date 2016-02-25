class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable,
         :omniauthable, :omniauth_providers => [ :facebook ]

  validates :fullname, presence: true, length: { maximum: 100 }

  has_many :rooms
  has_many :reservations

	def name
		fullname
	end

  def self.find_for_facebook_oauth(access_token, signed_in_resource=nil)
    data = access_token.info
    user = User.where(provider: access_token.provider, uid: access_token.uid).first
    
    if user
      return user
    else
      registered_user = User.where(email: data['email']).first
      if registered_user
        return registered_user
      else
        user = User.create(
          fullname: data.name,
          email: data.email, 
          provider: access_token.provider,
          uid: access_token.uid,
          password: Devise.friendly_token[0, 20],
          image: data.image
        )
      end 
    end
  end 

end
