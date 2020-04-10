class AddDefaultValueToResult < ActiveRecord::Migration[5.2]
  def up
      change_column_default :interventions, :result, "incomplete"
  end
  def down
      change_column_default :interventions, :result, nil
  end 
  
end
