class AwardsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new_multiple, :create_multiple]

  def index
    @user_class = UserClass.find(params[:user_class])
    #@user_class.update_attributes(updated_at: DateTime.now)
    @start_date = params[:start_date] ? DateTime.parse(params[:start_date]) : Date.today
    @end_date = params[:end_date] ? DateTime.parse(params[:end_date]) : Date.today

    @awards_group_by = @user_class.get_awards(@start_date..@end_date)
    @charts = pie_chart(@awards_group_by, "student awards report")
  end

  def latest_awards
    @user_classes = current_user.user_classes
  end

  def new_multiple
    @student_ids = params[:student_ids]
    @user_class_id = params[:user_class]
    @is_detail = params[:is_detail]
    respond_to do |format|
      format.js {
        if @is_detail
          render 'new_multiple_detail.js.erb'
        else
          render 'new_multiple.js.erb'
        end
      }
    end
  end
  
  def create_multiple
    if params[:behavior]
      #@search = Behavior.where("title like '%?%'", params[:behavior][:title])
      #if @search.any? == false
      #  flash[:notice] = "#{@saerch.title} is already exist"
      #  @behavior = @search[0]
      #else
      @behavior = Behavior.create(params[:behavior])
      #end
      @behavior_id = @behavior.id
    else
      @behavior_id = params[:behavior_id]
    end
    @user_class_id = params[:user_class_id]
    #@behavior_id = params[:behavior_id]
    @student_ids = params[:student_ids]
    @students = Student.find(@student_ids)
    @user_class = UserClass.find(@user_class_id)
    @behavior = Behavior.find(@behavior_id)

    if Award.create_multiple(@user_class_id, @behavior_id, @student_ids)
      respond_to do |format|
        format.js {
          
        }
      end
    else
      render 'new'
    end
  end
end
