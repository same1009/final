
class RecipesController < ApplicationController
      
  # GET /recipes
  # GET /recipes.json
  before_filter :authenticate_user!

  def index
     @recipes = User.find(current_user.id).recipes.page(params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @recipes }
    end
  end

  def lookingforrecipes
    #@myrecipes=User.find(current_user.id).recipes
    @allrecipes=Recipe.order('user_id asc').paginate(:page=>params[:page])
    #@myrecipes=User.find(current_user.id).recipes.page(params[:page])
    #@otherusers=User.where("id<>"+current_user.id.to_s)
    #@temp=Recipe.all-@myrecipes
    #@otherrecipes=@temp.paginate(:page => params[:page])
    #@otherrecipes=Recipe.otherrecipes(current_user.id).page(params[:page])
    respond_to do |format|
      format.html {render 'search'}
      format.json { render json: @recipes }
    end


  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/new
  # GET /recipes/new.json
  def new
    @recipe = Recipe.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @recipe }
    end
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = current_user.recipes.new(params[:recipe])
    @recipe.owner=true

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render json: @recipe, status: :created, location: @recipe }
      else
        format.html { render action: "new" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /recipes/1
  # PUT /recipes/1.json
  def update
    @recipe = Recipe.find(params[:id])

    respond_to do |format|
      if @recipe.update_attributes(params[:recipe])
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url }
      format.json { head :no_content }
    end
  end

  def searchforrecipes
    if(params[:searchrecipe]!=nil)
      @allrecipes=Recipe.where("name like ?",'%'+params[:searchrecipe]+'%').page(params[:page])
    elsif (params[:searchingredients]!=nil)
      @allrecipes=Recipe.where('ingredients like ?','%'+params[:searchingredients]+'%').page(params[:page])
    else
      @allrecipes=Recipe.calaverage(params[:searchrating]).paginate(:page => params[:page])    
    end

    #render 'search'
    respond_to do |format|
      format.html {render 'search'}
      format.json { render json: @recipes }
    end

  end

  def test
    @test=params[:test]
    render '_testuser.html.erb'
  end


end
