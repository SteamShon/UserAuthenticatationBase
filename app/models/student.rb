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
  def each_score(time=Date.today)
    result = {"POS" => 0, "NEG" => 0, "POS_SUM" => 0, "NEG_SUM" => 0}
  	self.awards.where("created_at >= ?", time).each do |award|
  		result["POS"] += award.behavior.score > 0 ? 1 : 0
  		result["NEG"] += award.behavior.score < 0 ? -1 : 0
      result["POS_SUM"] += award.behavior.score > 0 ? award.behavior.score : 0
      result["NEG_SUM"] += award.behavior.score < 0 ? award.behavior.score : 0
  	end
    return result
  end
end
