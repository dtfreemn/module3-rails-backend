class Reply < ApplicationRecord
  belongs_to :question
  belongs_to :replier, :foreign_key => "replier_id", :class_name => "User"
  has_many :likes, dependent: :destroy

  validates :question, :replier, :title, :content, presence: true

  scope :include_all, -> {includes(:likes).includes(:replier)}

  attr_accessor :score

  def score
    score = self.likes.reduce(0) do |sum, like|
      sum += like.point
    end
    self[:score] = score
  end
end
