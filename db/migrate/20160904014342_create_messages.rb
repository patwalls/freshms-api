class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.text :body
      t.boolean :sent, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
