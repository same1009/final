class Review < ActiveRecord::Base
  attr_accessible :comments, :rating, :receipe_id, :user_id

  validates :comments, :presence=>true
  validates :rating, :inclusion => {:in => [1,2,3,4,5]}

  belongs_to :recipe
  belongs_to :user

end
