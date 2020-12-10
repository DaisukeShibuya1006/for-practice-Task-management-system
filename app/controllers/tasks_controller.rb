class TasksController < ApplicationController
  def index
    title_search
    status_search
    tasks_sort
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

  # 優先順位を並べ替えるソートメソッドです
  # @tasksが返り値になります
  def tasks_sort
    @tasks = case params[:keyword]
             when 'high'
               @tasks.order('priority')
             when 'low'
               @tasks.order('priority DESC')
             else
               @tasks.order('created_at DESC')
             end
  end

  def title_search
    @tasks = params[:title].present? ? Task.where('title LIKE ?', "%#{params[:title]}%") : Task.all
  end

  def status_search
    @tasks = @tasks.where('status = ?', "#{params[:status]}") if params[:status].present?
  end
end
