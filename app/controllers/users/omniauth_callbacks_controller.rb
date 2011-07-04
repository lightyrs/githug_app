class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
#    render :text => env["omniauth.auth"].to_yaml
    @user = User.find_for_github_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "github"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.github_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end
end