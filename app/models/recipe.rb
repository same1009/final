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

  WillPaginate.per_page=2

 def self.calaverage(temp)
  find(:all, :select => 'recipes.avatar_updated_at,recipes.avatar_file_name,recipes.directions,recipes.name,recipes.ingredients, recipes.user_id,recipes.id',
             :joins  => 'INNER JOIN reviews ON recipes.id = reviews.recipe_id',
             :group  => 'recipes.avatar_updated_at,recipes.avatar_file_name,recipes.directions,recipes.name,recipes.ingredients, recipes.user_id,recipes.id HAVING avg(reviews.rating) >='+temp.to_s)
 end

 def self.searchcriteria(nametemp, ingredientstemp, ratingtemp)
    
    ratingtemp ||= '0'
    nametemp ||= ''
    ingredientstemp ||= ''

    self.connection.execute("select recipes.avatar_updated_at,recipes.avatar_file_name,recipes.directions,recipes.name,recipes.ingredients, recipes.user_id,recipes.id
                          from  recipes inner join reviews on recipes.id=reviews.recipe_id
                          where recipes.name like '%"+nametemp+"%' and ingredients like '%"+ingredientstemp+"%'
                          group by  recipes.avatar_updated_at,recipes.avatar_file_name,recipes.directions,recipes.name,recipes.ingredients, recipes.user_id,recipes.id
                          having avg(reviews.rating)>="+ratingtemp)

 end




end