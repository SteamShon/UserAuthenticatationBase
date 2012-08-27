class Behavior < ActiveRecord::Base
  attr_accessible :score, :title, :user_class_id, :is_detail, :desc
  belongs_to :user_class
end
