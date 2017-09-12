class Question < ApplicationRecord
  belongs_to :questioner, :foreign_key => "questioner_id", :class_name => "User"
  has_many :replies
  has_many :repliers, through: :replies

  validates :questioner, :title, :content, presence: true
end
