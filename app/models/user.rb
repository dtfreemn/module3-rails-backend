class User < ApplicationRecord
  has_many :questions, foreign_key: "questioner_id"
  has_many :replies, through: :questions, foreign_key: "replier_id"
end
