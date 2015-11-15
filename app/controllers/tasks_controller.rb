class TasksController < ApplicationController
  def index
    @tasks = Task.order("priority")
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.create(task_params)

    if @task.save
      redirect_to root_path, notice: 'Task save succesfully'
    else
      render 'new'
    end
  end

  def sort
    params[:task].each_with_index do |id, index|
      #code below will not work for rails 4
      # Task.update_all(priority: index + 1, id: id)
      Task.find(id).update_attribute(:priority, index+1)
    end
    render nothing: true
  end

  private
    def task_params
      params.require(:task).permit(:title, :description)
    end
end
