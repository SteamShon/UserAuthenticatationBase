class AvatarsController < ApplicationController
  def index
    @avatars = current_user.avatars
  end

  def new
  	@avatar = Avatar.new
  end

  def create
  	@avatar = Avatar.new(params[:avatar])
    current_user.avatars << @avatar
  	respond_to do |format|
      format.html {
      	redirect_to avatars_path
      }
    end
  end

  def destroy
  end
end
