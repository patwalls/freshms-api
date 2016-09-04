class Message < ActiveRecord::Base
  belongs_to :user
  scope :unsent, -> { where(sent: false) }
end
