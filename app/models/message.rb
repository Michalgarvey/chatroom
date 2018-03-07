class Message < ApplicationRecord
  after_create)commit { MessageUpdateJob.perform_later(self, self_user) }
end
