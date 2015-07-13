class Question < ActiveRecord::Base
  acts_as_votable
  has_many :comments
  validates :option1, presence: true
  validates :option2, presence: true
end
