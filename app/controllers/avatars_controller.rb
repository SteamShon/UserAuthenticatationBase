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
      format.html
      format.js
    end
  end

  def destroy
  end
end
