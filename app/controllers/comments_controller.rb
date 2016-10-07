class CommentsController < ApplicationController
	before_filter :authenticate_user, :only => [:create, :destroy]
  
def create
    @article = Article.find(params[:article_id])
    @comment = Comment.new
    @comment.user_id = get_current_user
    @comment = @article.comments.create(comment_params)

    redirect_to article_path(@article)
  end
 def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy
    redirect_to article_path(@article)
  end
  
  def show
	@article = Article.find(params[:article_id])
  @current_user = User.find(@article.user_id)
	redirect_to article_path(@article)
  end
  
  private
    def comment_params
      params.require(:comment).permit( :body)
    end
	
end
