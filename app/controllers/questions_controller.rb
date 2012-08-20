class QuestionsController < ApplicationController
  
  # Make a new question
  def new
    @question = Question.new
  end

  # Create a new question
  def create
    
    # Generate a new question based on input
    @question = Question.new(params[:question])
    
    # If the input is good, save it and redirect to the question index
    if @question.save
      flash[:success] = "Question added!"
      redirect_to questions_path
    
    # If the input is bad, re-render the new page and try again
    else
      render 'new'
    end
  end

  # Generate an index of all the questions
  def index
    @questions = Question.paginate(page: params[:page])
  end

  def show
    @question = Question.find(params[:id])
  end

end

