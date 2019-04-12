class User < ApplicationRecord
  enum role: [:user, :quiz_setter]
  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :user
  end

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  # has_many :questionnaires, through: :user_questionnaire_answer
  # has_many :questions, through: :user_questionnaire_answer
  # has_many :answers, through: :user_questionnaire_answer
  has_many :user_answered_questionnaires
end
