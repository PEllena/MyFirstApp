class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :product

  scope :rating_desc, -> { order(rating: :desc) }
  scope :rating_asc, -> { order(rating: :asc) }

  validates :body, presence: true
  validates :user, presence: true
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

  # Enqueue the job and run it when it's its turn (after all previously enqueued jobs).
  after_create_commit { CommentUpdateJob.perform_later(self, @user) }

end
