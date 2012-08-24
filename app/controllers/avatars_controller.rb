class AvatarsController < ApplicationController
  def index
    @avatars = Avatar.all
  end

  def new
  	@avatar = Avatar.new
  end

  def create
  	@avatar = Avatar.create(params[:avatar])
  	respond_to do |format|
      format.html {
      	redirect_to avatars_path
      }
    end
  end

  def destroy
  end
end
