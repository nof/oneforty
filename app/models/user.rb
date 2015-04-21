class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  validates :name, presence: true
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
end
