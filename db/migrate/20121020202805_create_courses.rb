class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.integer :holes
      t.integer :yards
      t.integer :par
      t.string :facility
      t.string :street
      t.string :city
      t.string :state
      t.string :zip
      t.integer :phone
      
      t.string :link
      t.text :description
      
      t.timestamps
    end
  end
end
