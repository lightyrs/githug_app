class UsersController < ApplicationController

  def show
    @user = User.find(params[:id], :include => :github_profile)
  end
end