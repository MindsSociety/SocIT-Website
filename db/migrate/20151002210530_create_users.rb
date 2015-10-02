class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string  :name
      t.string  :username
      t.integer :student_number
      t.string  :email
      t.string  :phone_number
      t.boolean :email_opt_in, default: false
      t.boolean :home_directory, default: false
      t.string  :profile_picture

      t.timestamps null: false
    end
  end
end
