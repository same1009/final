# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


require 'Faker'

# @recipe=Recipe.first

# @review=@recipe.reviews.new(:comments=>'mutiuple reviews', :rating=>4, :user_id=> @user.id)
# @review.save

# @user=User.first

# @recipe=@user.recipes.new(:name=>'user1', :ingredients=>'user1', :owner=>true)

# @recipe.save

# @review=@recipe.reviews.new(:comments=>'through recipe 1', :rating=>4, :user_id=> @user.id)

# @review.save


# @review2=@user.reviews.new(:comments=>'through user 1', :rating=>1, :recipe_id=>@recipe.id)
# @review2.save


 
 # User.where("id<>"+1.to_s).each do |user|
 	
 # 	user.recipes.each do|recipe|

 		

 # 	end
 	
 # end

# Recipe.delete_all
# Review.delete_all

# @user=User.first
# @recipe=@user.recipes.new(:name=>'user1', :ingredients=>'user1', :owner=>true)
# @recipe.save
# @user2=User.last
# @recipe2=@user2.recipes.new(:name=>'user2', :ingredients=>'user2', :owner=>true)
# @recipe2.save




# @recipe2=@recipe.reviews.new(:comments=>'good!',:rating=>4)
# @review.save

# puts @recipe.inspect
# puts @review.inspect
# puts @recipe.reviews.inspect
# puts @user.reviews.inspect

# @user=User.all

# @user.each do |user|

# 	2.times do |k|

# 		@recipe=user.recipe.new(
# 			:name => Faker::Name.bs,
# 			:ingredients => Faker::Lorem.words(10))
# 		@recipe.save

# 	end


# end

