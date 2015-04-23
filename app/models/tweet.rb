class Tweet < ActiveRecord::Base
  belongs_to :user
  has_many :favorites, dependent: :destroy
  validates :user_id, presence: true
  validates :body, presence: true, length: { maximum: 140 }
  default_scope -> { order('created_at DESC') }

  def self.timeline_by_user(user)
    Tweet.where(user_id: [user, *user.followees])
  end
end
