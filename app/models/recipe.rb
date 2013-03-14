class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :name,:owner, :directions
  validates :name, :presence =>true
  validates :ingredients, :presence => true
  validates :owner, :presence =>true
  validates :directions, :presence => :true

  belongs_to :user
  has_many :reviews, :dependent=>:destroy
  accepts_nested_attributes_for :reviews

  def extract

  	

  end

end