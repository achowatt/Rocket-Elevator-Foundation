class AddDefaultValueToStatus < ActiveRecord::Migration[5.2]
    def up
        change_column_default :interventions, :status, "pending"
    end

    def down
      change_column_default :interventions, :status, nil
    end
end
