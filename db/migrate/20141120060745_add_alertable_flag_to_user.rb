class AddAlertableFlagToUser < ActiveRecord::Migration
  def change
    add_column :kms_users, :alert, :boolean, default: false, null: false
  end
end
