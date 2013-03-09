class Review < ActiveRecord::Base
  attr_accessible :comments, :rating, :recipe_id, :user_id

  validates :comments, :presence=>true
  validates :rating, :inclusion => {:in => [1,2,3,4,5]}
  validates :recipe_id, :uniqueness => {:scope=>:user_id}

  belongs_to :recipe
  belongs_to :user

end
