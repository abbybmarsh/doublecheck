class CreateUsersReports < ActiveRecord::Migration
  def change
    create_table :users_reports do |t|
      t.integer :user_id
      t.integer :report_id
    end
  end
end
