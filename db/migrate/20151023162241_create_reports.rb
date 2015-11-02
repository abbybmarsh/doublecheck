class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.string :commenter
      t.text :body
      t.references :client, index: true, foreign_key: true

    end
  end
end
