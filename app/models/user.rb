class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  has_many :authentications, :dependent => :destroy
  has_one :github_profile, :dependent => :destroy

  has_friendly_id :nickname, :use_slug => true

  def nickname
    "#{self.github_profile.nickname}"
  end

  def self.find_for_github_oauth(access_token, signed_in_resource=nil)
    data = access_token['extra']['user_hash']
    if user = User.find_by_email(data["email"])
      user
    else # Create a user with a stub password.
      user = User.create!(:email => data["email"], :password => Devise.friendly_token[0,20])
      user.authentications.create!(:uid => data["id"], :token => access_token["credentials"]["token"])
      user.gather_github_profile_data(access_token)
      user
    end
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["user_hash"]
        user.email = data["email"]
      end
    end
  end

  def gather_github_profile_data(access_token)
    data = access_token
    self.create_github_profile(
      :nickname => data["user_info"]["nickname"],
      :name => data["user_info"]["name"],
      :profile_url => data["user_info"]["urls"]["GitHub"],
      :blog_url => data["user_info"]["urls"]["Blog"],
      :gravatar_id => data["extra"]["user_hash"]["gravatar_id"],
      :company => data["extra"]["user_hash"]["company"],
      :location => data["extra"]["user_hash"]["location"],
      :join_date => data["extra"]["user_hash"]["created_at"]
    )
  end
  handle_asynchronously :gather_github_profile_data
end
