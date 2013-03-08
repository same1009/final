class Recipe < ActiveRecord::Base
  attr_accessible :ingredients, :name,:owner
  validates :name, :presence =>true
  validates :ingredients, :presence => true
  validates :owner, :presence =>true

  has_many :reviews, :dependent=>:destroy
  accepts_nested_attributes_for :reviews
  belongs_to :user
end
