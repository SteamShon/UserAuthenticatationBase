class Behavior < ActiveRecord::Base
  attr_accessible :score, :title, :user_class_id
  belongs_to :user_class
end
