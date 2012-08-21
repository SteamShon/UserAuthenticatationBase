class AwardsController < ApplicationController
  before_filter :signed_in_user, only: [:index, :new_multiple, :create_multiple]

  def index
  	@user_class = UserClass.find(params[:user_class])
    @user_class.update_attributes(updated_at: DateTime.now)
    @start_date = params[:start_date] ? DateTime.parse(params[:start_date]) : @user_class.created_at
    @end_date = params[:end_date] ? DateTime.parse(params[:end_date]) : @user_class.updated_at

    @awards_group_by = @user_class.get_awards(@start_date..@end_date)
    @charts = {}
    for key, data in @awards_group_by
    	@charts["#{key}"] = LazyHighCharts::HighChart.new("#{key}") do |f|
    	  f.options[:title] = "Student awards report"
	      f.options[:chart][:renderTo] = "#{key}"
	      f.options[:chart][:defaultSeriesType] = "pie"
	      f.series(:data=>data.collect{|k, v| [k, v["count"]]})
	    end
    end
  end

  def latest_awards
    begin 
      @user_class = UserClass.find(current_user.id)
    rescue
      @user_class = nil
    end
    if @user_class
      @awards = @user_class.awards.order("created_at DESC").paginate(params[:page])
      @awards_by_date = current_user.awards_by_date(@awards)
    end
  end

  def new_multiple
    @student_ids = params[:student_ids]
    @user_class_id = params[:user_class]
    respond_to do |format|
      format.js {}
    end
  end
  
  def create_multiple
    @user_class_id = params[:user_class_id]
    @behavior_id = params[:behavior_id]
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
