class CreateJobs < ActiveRecord::Migration[6.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.integer :pay
      t.date :start_date
      t.date :deadline
      t.references :employer, null: false,  foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
