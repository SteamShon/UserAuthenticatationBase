class Student < ActiveRecord::Base
  attr_accessible :name, :user_class_id
  has_many :awards, dependent: :destroy
  belongs_to :user_class

  def self.multiple_names(ids, del=",")
    Student.find(ids).collect{|s| s.name}.join(del)
  end
  def total_score(time)
  	sum = 0
  	self.awards.where("created_at >= ?", time).each do |award|
  		sum += award.behavior.score
  	end
  	return sum
  end
  def each_score(time)
  	pos, neg = [0, 0]
  	self.awards.where("created_at >= ?", time).each do |award|
  		pos += award.behavior.score == 1 ? 1 : 0
  		neg += award.behavior.score == -1 ? -1 : 0
  	end
  	return [pos, neg]
  end
end
