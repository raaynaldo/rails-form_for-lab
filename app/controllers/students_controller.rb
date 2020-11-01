class StudentsController < ApplicationController
    def show
        @student = Student.find(params[:id])
    end
    
    def new
        @student = Student.new
    end
    
    def create
        student = Student.create(get_params)

        redirect_to student_path(student)
    end

    def edit
        @student = Student.find(params[:id])

        render "new"
    end

    def update
        student = Student.find(params[:id])
        student.update(get_params)

        redirect_to student_path(student)
    end

    private
    def get_params
        params.require(:student).permit(:first_name, :last_name)
    end
end
