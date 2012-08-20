class StudentsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new, :create, :update, :edit]
  def new
  end

  def create
    @user_class = UserClass.find(params[:user_class_id])
    params[:students].split(/\r?\n/).each do |student|
      @user_class.students << Student.create(name: student.strip) unless student.strip == ""
    end
    respond_to do |format|
      format.html 
      format.js {
        @user_class = UserClass.find(params[:user_class_id])
        @students = @user_class.students
      }
    end
      
  end

  def index
  end

  def update
  end

  def edit
  end
end
