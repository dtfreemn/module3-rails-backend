class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :replier, :foreign_key => "replier_id", :class_name => "User"
  has_many :likes

  validates :question, :replier, :title, :content, presence: true
end
