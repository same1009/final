class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :name,:owner, :directions, :avatar
  validates :name, :presence =>true
  validates :ingredients, :presence => true
  validates :owner, :presence =>true
  validates :directions, :presence => :true
  has_attached_file :avatar

  belongs_to :user
  has_many :reviews, :dependent=>:destroy
  accepts_nested_attributes_for :reviews

  def extract

  	

  end

end