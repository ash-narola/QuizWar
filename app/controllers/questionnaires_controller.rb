class QuestionnairesController < ApplicationController
  
  before_action :set_questionnaire, only: [:prepare_test, :submit_test]
  before_action :set_user, only: [:prepare_test, :submit_test]
  
  def dashboard   
    @user = current_user
    @questionnaires = Questionnaire.order(created_at: :desc)
  end
  
  def set_test
    @questionnaire = Questionnaire.new(setter_id: current_user)
  end
  
  def create_test
    q = Questionnaire.new(questionnaire_params)
    q.setter = current_user
    q.save!
  end
  
  def prepare_test
    @user_answered_questionnaire = current_user.user_answered_questionnaires.new(questionnaire: @questionnaire)
  end
  
  def submit_test
    u = @user_answered_questionnaire = current_user.user_answered_questionnaires.new(user_answered_questionnaire_params)
    u.save!
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
