class CreateApplications < ActiveRecord::Migration[6.0]
  def change
    create_table :applications do |t|
      t.references :applicant, null: false, foreign_key: { to_table: :users }
      t.references :job, null: false, foreign_key: true

      t.timestamps
    end
  end
end
