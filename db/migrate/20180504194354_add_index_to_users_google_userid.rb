class AddIndexToUsersGoogleUserid < ActiveRecord::Migration[5.2]
  def change
    add_index :google_userid, unique: true
  end
end
