class BehaviorsController < ApplicationController
	before_filter :signed_in_user, only: [:create]
	def create
		@user_class = UserClass.find(params[:user_class])
		@score = params[:score]
		@user_class.behaviors << Behavior.create(user_class_id: @user_class.id, score: @score)
		@behaviors = UserClass.find(params[:user_class]).behaviors.where("score = ?", @score)
	end
end
