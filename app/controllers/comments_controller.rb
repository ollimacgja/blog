class CommentsController < ApplicationController
  before_filter :get_parent

  def new
    @comment = @parent.comments.build
  end
 
  def create
    @comment = @parent.comments.build(params[:comment])
     
    if @comment.save
      redirect_to @comment.post, :notice => 'Thank you for your comment!'
    else
      render :new
    end
  end
 def edit
   @comment = Comment.find_by_id(params[:id])
 end

 def update
    @comment = Comment.find_by_id(params[:id])
     
    if @comment.update_attributes(params[:comment])
      redirect_to @comment.post, :notice => 'Thank you for your edition!'
    else
      render :edit
    end
 end
  protected
   
  def get_parent
    @parent = Post.find_by_id(params[:post_id]) if params[:post_id]
    @parent = Comment.find_by_id(params[:comment_id]) if params[:comment_id]
     
    redirect_to posts_path unless defined?(@parent)
  end
end