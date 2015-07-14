class QuestionsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_question, only: [:show, :upvote, :downvote]

  def index
    @questions = Question.all.order('created_at DESC')
  end

  def new
    @question = Question.new
    @comment = Comment.new
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      redirect_to @question
    else
      render 'new'
    end
  end

  def show
    @question = Question.find(params[:id])
    @comment = Comment.new
  end

  def upvote
    @question.upvote_from current_user
    redirect_to questions_path
  end

  def downvote
    @question.downvote_from current_user
    redirect_to questions_path
  end

  private

  def set_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:option1, :option2)
  end

end
