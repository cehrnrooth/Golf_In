class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      
      t.string :linkedin_id
      t.string :picture_url
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :company
      t.integer :company_id
      t.string :location
      t.string :industry
      t.integer :home_course
      t.string :schedule
      t.text :connections, :limit => nil
      t.integer :handicap, :default => 0
      t.string :public_linkedin_link
      
      t.timestamps
    end
    
    add_index :players, :email, unique: true
    add_index :players, :linkedin_id, unique: true
    add_index :players, :company_id
  end
end
