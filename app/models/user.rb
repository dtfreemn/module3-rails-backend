class User < ApplicationRecord
  has_many :questions, foreign_key: "questioner_id"
  has_many :replies, through: :questions, foreign_key: "replier_id"

  validates :name, :email, presence: true
  validates :email, uniqueness: {case_sensitive: false}
end
