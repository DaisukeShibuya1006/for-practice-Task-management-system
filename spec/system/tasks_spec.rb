require 'rails_helper'

describe "タスク一覧" do
   describe "タスクが作成されている。" do
      before do
        @task = FactoryBot.create(:task, title: "タイトルA",text: "詳細A")
      end

      it "タスク作成日時の降順"do 
        @tasks = Task.all.order(created_at: :desc)
      end
   end
  
end
