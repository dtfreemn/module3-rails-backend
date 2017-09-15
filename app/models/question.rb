class Question < ApplicationRecord
  belongs_to :questioner, :foreign_key => "questioner_id", :class_name => "User"
  has_many :replies, dependent: :destroy
  has_many :repliers, through: :replies

  validates :questioner, :title, :content, presence: true

  scope :includes_all, -> {includes(:questioner).includes(:replies).includes(:replies => [{:likes => :user}, :replier])}

  searchable do
    text :title, :content
    text :replies_titles do
      replies.map {|reply| reply.title}
    end
    text :replies_content do
      replies.map {|reply| reply.content}
    end
  end
end
