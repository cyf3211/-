class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie_group
end
