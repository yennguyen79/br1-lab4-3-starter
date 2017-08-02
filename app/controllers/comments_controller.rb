class CommentsController < ApplicationController
  def create
    @photo = Photo.find params[:photo_id]
    @comment = @photo.comments.create(comment_params)
    if @comment.valid?
      redirect_to root_path, flash: {success: "Added comment."}
    else 
      redirect_to root_path, flash: {error: " Can not add comment"}
    end
  end

  def comment_params
    params.require(:comment).permit(:body, :username)
  end
end  
