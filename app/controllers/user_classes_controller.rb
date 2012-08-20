class UserClassesController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create, :edit, :update, :show]
  def index
    @user_classes = current_user.user_classes
  end

  def new
    @user_class = UserClass.new
  end

  def create
    @user_class = UserClass.new(params[:user_class])
    if current_user.user_classes << @user_class
      respond_to do |format|
        format.html {
          flash[:notice] = "new class has been created."
          redirect_to user_classes_path    
        }
        format.js {
          @user_classes = current_user.user_classes
        }
      end
    else
      render 'new'
    end
  end
  def edit
    @user_class = UserClass.find(params[:id])
    @students = @user_class.students
  end

  def update
    @user_class = UserClass.find(params[:id])
    @students = @user_class.students
    if @user_class.update_attributes(params[:user_class])
        respond_to do |format|
          format.html {}
          format.js {
            @user_class = UserClass.find(params[:id])
          }
        end
    else
        render "edit"
    end
  end
  def show
    @user_class = UserClass.find(params[:id])
    @student = @user_class.students[0]
  end
end
