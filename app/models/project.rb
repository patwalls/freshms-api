class Project < ActiveRecord::Base
  has_many :project_subscriptions
  has_many :users, through: :project_subscriptions

  scope :unleaked, -> { where(leaked: false) }

  def notify_subscribers_of_leak
    message = "#{title} has leaked."
    users.each do |user|
      Message.create(user_id: user.id, body: message)
    end
  end
end
