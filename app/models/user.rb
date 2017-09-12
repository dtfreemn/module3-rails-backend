class User < ApplicationRecord
  has_many :questions
  has_many :replies, through: :questions
end
