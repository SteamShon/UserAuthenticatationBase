class Award < ActiveRecord::Base
  attr_accessible :user_class_id, :behavior_id, :student_id, :created_at, :updated_at
  belongs_to :user_class
  belongs_to :student
  belongs_to :behavior

  def self.create_multiple(user_class_id, behavior_id, student_ids)
  	for student_id in student_ids
  		if Award.create({ user_class_id: user_class_id, behavior_id: behavior_id, student_id: student_id }) == false
  			return false
  		end
  	end
  	return true
  end

  def self.awards_by_date(awards)
    result = {}
    awards.each{|award| 
      k = award.created_at.to_date
      if result.has_key?(k)
        result[k] << award
      else
        result[k] = []
      end
    }
    return result
  end
end
