class StudentScoresController < ApplicationController

  before_action :set_student_score, only: [:edit, :update]

  def new
    @student = Student.find(params[:student_id])
    @student_score = StudentScore.new(student_id: @student.id)

    @students = Student.all
    @subjects = Subject.all
  end

  def create
    @student = Student.find(student_score_params[:student_id])
    @student_score = StudentScore.new(student_score_params)
    @subjects = Subject.all

    if @student_score.save
      redirect_to student_path(@student), notice: "Score added successfully"
    else
      @students = Student.all
      @subjects = Subject.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @student = @student_score.student
    @subjects = Subject.all
    @students = Student.all
  end

  def update
    @student = @student_score.student

    if @student_score.update(student_score_params)
      redirect_to student_path(@student), notice: 'Score updated successfully.'
    else
      @students = Student.all
      @subjects = Subject.all
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_student_score
    @student_score = StudentScore.find(params[:id])
  end

  def student_score_params
    params.require(:student_score).permit(:student_id, :subject_id, :score1, :score2)
  end
end
