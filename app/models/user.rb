class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
   has_many :movie_groups
   has_many :reviews
   has_many :movie_group_relationships
   has_many :participated_movie_groups, :through => :movie_group_relationships, :source => :movie_group

   def favorite?(movie_group)
      participated_movie_groups.include?(movie_group)
   end


  def favorite!(movie_group)
    participated_movie_groups << movie_group
  end

  def unfavorite!(movie_group)
    participated_movie_groups.delete(movie_group)
  end
end
