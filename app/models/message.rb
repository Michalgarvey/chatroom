class Message < ActiveRecord::Base
  belongs_to :room
  belongs_to :user

  validates :body, presence: true
  validates :user, presence: true
  validates :room, presence: true

  after_create_commit { MessageUpdateJob.perform_later(self, self_user) }
end
