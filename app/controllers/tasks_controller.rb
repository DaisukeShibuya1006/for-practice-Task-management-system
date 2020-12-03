class TasksController < ApplicationController
  def index
    @tasks = params[:title].present? ? Task.where('title LIKE ?', "%#{params[:title]}%") : Task.all
    if params[:status].present?
      @tasks = @tasks.where('status::text LIKE ?', "%#{params[:status]}%")
    else
      @tasks.all
    end
    priority_sort(params[:keyword])
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def edit
    @task = Task.find(params[:id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'タスクを登録しました。'
      redirect_to tasks_path
    else
      flash[:alert] = 'タスクの登録が失敗しました。'
      render 'new'
    end
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      redirect_to tasks_path
      flash[:notice] = 'タスクを変更しました。'
    else
      flash[:alert] = 'タスクの変更に失敗しました。'
    end
  end

  def destroy
    @task = Task.find(params[:id])
    if @task.destroy
      redirect_to tasks_path
      flash[:notice] = 'タスクを削除しました。'
    else
      flash[:alert] = 'タスクの削除に失敗しました。'
      redirect_to tasks_path
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :text, :deadline, :status, :priority)
  end

  def priority_sort
    @tasks = if params[:keyword] == 'high'
               @tasks.order('priority')
             elsif params[:keyword] == 'low'
               @tasks.order('priority DESC')
             else
               @tasks.order('created_at DESC')
             end
  end
end
