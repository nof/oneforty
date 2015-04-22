class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :relationships, foreign_key: 'follower_id', dependent: :destroy
  has_many :followees, through: :relationships
  has_many :reverse_relationships, class_name: 'Relationship', foreign_key: 'followee_id', dependent: :destroy
  has_many :followers, through: :reverse_relationships
  validates :name, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def follow?(user)
    relationships.find_by(followee: user)
  end

  def follow!(user)
    relationships.create!(followee: user)
  end

  def unfollow!(user)
    relationships.find_by(followee: user).destroy
  end

  def timeline
    tweets.all
  end
end
