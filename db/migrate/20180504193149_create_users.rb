class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :google_userid
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
