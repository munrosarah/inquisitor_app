class AnswersController < ApplicationController
  def create
    # Build an answer with the current user and the given content
    @answer = current_user.answers.build(params[:answer])
    
    # This is a little wonky... I had to manually set the question id
    # couldn't quite get the associations to work automatically
    @answer.question_id = params[:answer][:question_id]
    
    # If the answer successfully saved, redirect back to questions
    if @answer.save
      flash[:success] = "Question answered!"
      redirect_to 'answer_questions'
    else
      flash[:fail] = "Oops, that didn't work."
      redirect_to 'answer_questions'
    end
  end
  
  def show
    @answer = Answer.find(params[:id])
  end
  
  def destroy
  end
end
