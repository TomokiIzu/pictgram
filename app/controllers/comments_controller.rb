class CommentsController < ApplicationController
  def create
  end

  def destroy
  end
private
    def content_params
      params.require(:comment).permit(:content)
    end

def create
  image = Image.find(params[:image_id])
  @comment = image.comments.build(comment_params)
  if @comment.save
    flash[:success] = "コメントしました"
    redirect_back(fallback_location: image_url(image.id))
  else
    flash[:danger] = "コメントできません"
    redirect_back(fallback_location: image_url(image.id))
  end 
end 

def destroy
  image = Image.find(params[:image_id])
  @comment = image.comments.find(params[:id])
  @comment.destroy
  redirect_back(fallback_location: image_path(image)
end

end