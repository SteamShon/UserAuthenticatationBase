class BehaviorsController < ApplicationController
	before_filter :signed_in_user, only: [:create]
	def create
		@user_class = UserClass.find(params[:user_class])
		@score = params[:score]
		@user_class.behaviors << Behavior.create(user_class_id: @user_class.id, score: @score)
		@behaviors = @user_class.behaviors
	end

	def destroy
		@behavior = Behavior.find(params[:id])
		@behavior.destroy
	end
end
