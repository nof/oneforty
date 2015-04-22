class Tweet < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }

  def self.timeline_by_user(user)
    Tweet.where(user_id: [user, *user.followees])
  end
end
