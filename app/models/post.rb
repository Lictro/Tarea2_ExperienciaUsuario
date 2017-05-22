class Post < ApplicationRecord
  validates :title,presence: true, length: {maximum: 20}
  validates :message,presence: true, length: {maximum: 300}
end
