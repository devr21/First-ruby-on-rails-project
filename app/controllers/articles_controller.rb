class ArticlesController < ApplicationController

	before_filter :authenticate_user, :only => [ :new, :create, :edit, :update]

	def index
		@articles = Article.all
	end

	def new
		@article = Article.new
	end

	def edit
		@article = Article.find(params[:id])
	end

	def update
    @article = Article.find(params[:id])
 
    if @article.update(parameters)
      redirect_to @article
    else
      render 'edit'
    end
  end

	def create
		@article = Article.new(parameters)
		@article.user_id = get_current_user
		if @article.save
			redirect_to @article
		else
			render 'new'
		end

	end

	def show
		@article = Article.find(params[:id])
		
	end

  private
    def parameters
      params.require(:article).permit(:title, :text)
    end

end
