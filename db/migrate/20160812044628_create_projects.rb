class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :link
      t.boolean :leaked
      
      t.timestamps
    end
  end
end
