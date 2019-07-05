class StudentsController < ApplicationController

  skip_before_action :require_user, only: [:new, :create]
before_action :set_student, only: [:show, :edit, :update]

def index
  @students = Student.all
end

def show

end

def new
  @student = Student.new
end

def edit
  if @student == current_user
  else
    flash[:notice] = "You can only edit your own profile"
    redirect_to students_path
  end

end

def update

  if @student.update(student_params)
    flash[:notice] = "You have successfully updated your profile"
    redirect_to student_path(@student)
  else
    render 'edit'
  end
end


def create
  @student = Student.new(student_params)
  if @student.save
    flash[:notice] = "You have successfully signed up"
    redirect_to student_path(@student)

  else
    render 'new'
  end
end

private

def student_params
  params.require(:student).permit(:name, :username, :email, :password, :password_confirmation, :course_id)
end

def set_student
  @student = Student.find(params[:id])
end


end
