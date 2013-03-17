class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable




  # Setup accessible (or protected) attributes for your modeler_me
  attr_accessible :email, :password, :password_confirmation, :rememb, :avatar
  # attr_accessible :title, :body

  validates :email, :presence => true
  validates :password, :presence => true

  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes
  #has_many :reviews, :through=> :recipes, :dependent=>:destroy
  has_many :reviews, :dependent=>:destroy

  has_attached_file :avatar


end
