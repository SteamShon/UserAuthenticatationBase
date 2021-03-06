class UserClass < ActiveRecord::Base
  attr_accessible :grade, :title, :created_at, :updated_at
  belongs_to :user
  has_many :behaviors, dependent: :destroy
  has_many :students, dependent: :destroy
  has_many :awards, dependent: :destroy
  accepts_nested_attributes_for :behaviors, :reject_if => lambda {|s| s[:title].blank? }, :allow_destroy => true
  attr_accessible :behaviors_attributes

  def self.behaviors(id, score=nil)
    if score
      UserClass.find(id).behaviors.where("score = ?", score)
    else
      UserClass.find(id).behaviors
    end
  end
  def good_behaviors(is_detail=0)
    self.behaviors.where("score > ? and is_detail = ?", 0, is_detail)
  end
  def bad_behaviors(is_detail=0)
    self.behaviors.where("score < ? and is_detail = ?", 0, is_detail)
  end
  
  def get_awards(range, student=nil) 
    result = { "ALL" => {} }
    @awards = self.awards.where(created_at: range)
    for award in @awards 
      if !result.has_key?(award.student_id)
        result[award.student_id] = {}
      end
      if !result[award.student_id].has_key?(award.behavior.title)
        result[award.student_id][award.behavior.title] = { "score" => award.behavior.score, "count" => 0 }
      end
      result[award.student_id][award.behavior.title]["count"] += 1
      if !result["ALL"].has_key?(award.behavior.title) 
        result["ALL"][award.behavior.title] = { "score" => award.behavior.score, "count" => 0 }
      end
      result["ALL"][award.behavior.title]["count"] += 1
    end
    result
  end
end
