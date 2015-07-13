class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @question = Question.find(params[:question_id])
    @comment = @question.comments.create(params[:comment].permit(:body))

      redirect_to root_path
  end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end


end
