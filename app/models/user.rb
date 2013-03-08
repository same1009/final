class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable



  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  validates :email, :presence => true
  validates :password, :presence => true

  has_many :recipes, :dependent => :destroy
  accepts_nested_attributes_for :recipes
  has_many :review, :through=> :recipes, :dependent=>:destroy

end
