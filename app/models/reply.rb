class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :replier, :foreign_key => "replier_id", :class_name => "User"
  has_many :likes, dependent: :destroy

  validates :question, :replier, :title, :content, presence: true

  scope :include_all, -> {includes(:likes).includes(:replier)}
end
