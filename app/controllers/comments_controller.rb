class CommentsController < ApplicationController

   before_action :require_user, except: [:index, :show]
  
   # def show
   # 	@comment = Comment.find(params[:id])
   # end


   def create
    @post = Post.find(params[:post_id])
   	@comment = Comment.new(comment_params)
    @comment.post = @post
    @comment.user = current_user


     if @comment.save 
       flash[:notice] = "Your comment was created"
       redirect_to post_path(@post)
     else
       render 'posts/show'
     end
   end

  # def update
  #  	@comment = Comment.new(comment_params)


  #    if @comment.save 
  #      flash[:notice] = "Your comment was updated"
  #      redirect_to root_path
  #    else
  #      render 'posts/show'
  #    end
  #  end

   def vote
    @vote = Vote.create(voteable: @comment, user: current_user, vote: params[:vote])

    if @vote.valid?
      flash[:notice] = "Your vote was counted"
    else
      flash[:error] = "You can only vote for <strong>that</strong> once".html_safe
    end

    redirect_to :back  
  end

    private

    def comment_params
      params.require(:comment).permit!
    end


end