class CreateProfiles < ActiveRecord::Migration
  # create profile table and add user at the same time
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :job_title
      t.string :phone_number
      t.string :contact_email
      t.text :description

      t.timestamps
    end
  end
end
