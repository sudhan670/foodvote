class Comment < ApplicationRecord
  belongs_to :vote
  validates :content, presence: true
end
