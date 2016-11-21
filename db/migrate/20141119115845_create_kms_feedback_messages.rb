class CreateKmsFeedbackMessages < ActiveRecord::Migration
  def change
    create_table :kms_feedback_messages do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :message

      t.timestamps null: false
    end
  end
end
