class EmployeesController < ApplicationController
    def index
        @employees = Employee.all
    end

    def show
        @employee = Employee.find_by(id: params[:id])
    end

    def new
        @employee = Employee.new
        @dogs = Dog.all
    end

    def create
        # byebug
        @dogs = Dog.all
        @employee = Employee.new(employee_params)
        if @employee.save
            redirect_to @employee
        else
            # byebug
            render :new 
        end
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :alias, :title, :office, :dog_id, :img_url)
    end
end
