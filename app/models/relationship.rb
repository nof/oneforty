class Relationship < ActiveRecord::Base
  belongs_to :follower, class_name: 'User'
  belongs_to :followee, class_name: 'User'
  validates :follower_id, presence: true
  validates :followee_id, presence: true
  validate :follow_self

  private
    def follow_self
      errors.add(:follower_id) if (follower_id == followee_id)
    end
end
