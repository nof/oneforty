class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  def timeline
    self.tweets.all
  end
end
