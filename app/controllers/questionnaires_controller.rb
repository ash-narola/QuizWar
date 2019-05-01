class QuestionnairesController < ApplicationController
  
  before_action :set_questionnaire, only: [:prepare_test, :submit_test, :show_score]
  before_action :set_user, only: [:prepare_test, :submit_test, :show_score]
  
  def dashboard   
    @user = current_user
    @questionnaires = Questionnaire.order(created_at: :desc)
    p @questionnaires
  end
  
  def set_test
    @questionnaire = Questionnaire.new(setter_id: current_user)
    p 'set_test--------------------------'
    p @questionnaire
  end
  
  def create_test
   # binding.pry
    q = Questionnaire.new(questionnaire_params)
    p questionnaire_params
    q.setter = current_user
    q.save!
    redirect_to root_path
  end

  def prepare_test
    p 'prepare_test------------------------------'
    @user_answered_questionnaire = @user.user_answered_questionnaires.new(questionnaire: @questionnaire)
    p @user_answered_questionnaire
  end 
  
  def submit_test
    u = @user_answered_questionnaire = current_user.user_answered_questionnaires.new(user_answered_questionnaire_params)
    u.questionnaire = @questionnaire
    u.save! 
    redirect_to users_questionnaire_score_path
  end

  def show_score 
    @valid_ans_id = Answer.joins(:question).where(answers: {valid_option:true})
                                           .where(questions: {questionnaire_id: @questionnaire})
                                           .select(:id)
    @user_ans_id = UserQuestionnaireAnswer.joins(:user_answered_questionnaire)
                                          .where(user_answered_questionnaires: {questionnaire_id: @questionnaire} && {user_id: @user})
                                          .select(:answer_id)
    @count = 0
  end 

  private
  
  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end
  
  def set_user
     @user = User.find(params[:user_id])
  end
    
  def questionnaire_params
    params.require(:questionnaire).permit(:name, questions_attributes: [:question, answers_attributes: [:answer, :valid_option]])
  end  
  
  def user_answered_questionnaire_params
    params.require(:user_answered_questionnaire).permit(user_questionnaire_answers_attributes: [:answer_id, :question_id])
  end
  
end
