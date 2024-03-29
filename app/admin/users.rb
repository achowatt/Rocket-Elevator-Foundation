ActiveAdmin.register User do
    permit_params :email, :password, :password_confirmation, :admin
  
    index do
      selectable_column
      id_column
      column :email
      column "Employee", :admin
      #column :current_sign_in_at
      #column :created_at
      actions
    end
  
    filter :email
    filter :current_sign_in_at
    filter :created_at
  
    form do |f|
      f.inputs do
        f.input :email
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
  end
  