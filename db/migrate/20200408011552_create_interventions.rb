class CreateInterventions < ActiveRecord::Migration[5.2]
  def change
    create_table :interventions do |t|
      t.integer :author
      t.integer :customer_id
      t.integer :building_id
      t.integer :battery_id
      t.integer :column_id
      t.integer :elevator_id
      t.integer :employee_id
      t.timestamp :start_date
      t.timestamp :end_date
      t.string :result, default: "incomplete"
      t.string :report
      t.string :status, default: "pending"
      t.timestamps
    end
  end
end

