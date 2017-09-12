class Like < ApplicationRecord
  belongs_to :user
  belongs_to :reply

  validates :user, :reply, presence: true
  validates_uniqueness_of :user_id, :scope => :reply_id
end
