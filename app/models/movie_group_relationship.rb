class MovieGroupRelationship < ApplicationRecord
  belongs_to :movie_group 
  belongs_to :user
end
