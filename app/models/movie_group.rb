class MovieGroup < ApplicationRecord
  has_many :reviews
  has_many :movie_group_relationships
  has_many :members, :through => :movie_group_relationships, :source => :user
  belongs_to :user
  validates :title, presence: true
end
