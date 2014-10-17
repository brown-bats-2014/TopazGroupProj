class Answer < ActiveRecord::Base
  # Remember to create a migration!
  belongs_to :user
  belongs_to :question
  belongs_to :choice
  validate :only_choose_once

  def only_choose_once
    answer = Answer.find_by(user_id: self.user_id, question_id: self.question_id)
    if !answer.nil? && self.id.nil?
      self.errors[:base] <<  "You can only make a single choice for a given question on a survey"
    end
  end
end
