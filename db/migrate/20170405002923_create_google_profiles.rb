class CreateGoogleProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :google_profiles do |t|

      t.timestamps
    end
  end
end
