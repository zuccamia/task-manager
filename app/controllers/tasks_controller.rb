class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    render :new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to :all_tasks
    else
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
    render :edit
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to task_path(@task)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    redirect_to :all_tasks
  end

  private

  def task_params
    params.require(:task).permit(:title, :details, :completed)
  end
end
