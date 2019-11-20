class LifestyleEventType < ApplicationRecord
  validates :title, presence: true, uniqueness: true

  default_scope { order(created_at: :desc) }
end
