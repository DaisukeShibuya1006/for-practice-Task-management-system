class TasksController < ApplicationController
  def index
    @task = Task.all
  end

  def show
    @task = Task.find_by(id:params[:id])
  end

  def create
  end

  def destroy
  end
end
