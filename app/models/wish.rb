class Wish < ApplicationRecord
  validates :name, length: { maximum: 50 }
  validates :message, presence: true, length: { maximum: 100 }
end
