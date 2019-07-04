class StudentsController < ApplicationController
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
  params.require(:student).permit(:name, :username, :email, :password, :course_id)
end

def set_student
  @student = Student.find(params[:id])
end


end
