class ReviewsController < ApplicationController
  before_filter :authenticate_user!
  # GET /reviews
  # GET /reviews.json
  def index

    @myreviews=Review.where('user_id='+current_user.id.to_s)
     
    respond_to do |format|
      format.html {render 'index'}
       #format.html # index.html.erb
       format.json { render json: @reviews }
     end
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.find(params[:review_id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.json
  def new
    @review=Recipe.find(params[:id]).reviews.new()

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:review_id])
  end

  # POST /reviews
  # POST /reviews.json
  def create

     @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html {redirect_to recipe_path(@review.recipe_id)}
        #format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        #format.html {redirect_to new_review_path}
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end


  def create2
    @review=recipe.reviews.build()    
    # @review = Review.new(params[:review])

    respond_to do |format|
      if @review.save
        format.html { redirect_to @review, notice: 'Review was successfully created.' }
        format.json { render json: @review, status: :created, location: @review }
      else
        format.html { render action: "new" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.json
  def update
    @review = Review.find(params[:review_id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to review_path, notice: 'Review was successfully updated.' }
        format.json { head :no_content }
      else
        format.html {render 'recipes/_testuser.html.erb'}
        #format.html{redirect_to edit_review_path}
        #format.html { render action: "edit" }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy_from_recipe_page
    @review = Review.find(params[:review_id])
    
    #@temp='from ths destroy from recipe method'
    #@review = Review.find(params[:id])
    #@review.destroy

    respond_to do |format|
       #format.html {render 'recipes/_testuser.html.erb'}
      #format.html { redirect_to recipe_path() reviews_url }
      #format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end



  def destroy_from_review_page
    @review = Review.find(params[:review_id])
    @review.destroy

    respond_to do |format|
      #format.html {render 'recipes/_testuser.html.erb'}
      format.html { redirect_to reviews_path }
      #format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

    def delete
    @review = Review.find(params[:review_id])

    respond_to do |format|
       format.html {render 'recipes/_testuser.html.erb'}
      #format.html { redirect_to reviews_url }
      #format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end

  def destroy
    @review = Review.find(params[:review_id])
    @temp='from the delete  method'
    #@review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|

      if (params[:id].nil?)
        format.html { redirect_to reviews_path}
      else
        format.html { redirect_to recipe_path}
      end
       #format.html {render 'recipes/_testuser.html.erb'}
      #format.html { redirect_to reviews_url }
      #format.html { redirect_to reviews_url }
      format.json { head :no_content }
    end
  end




end
