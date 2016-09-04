class CreateProjectSubscriptionsTable < ActiveRecord::Migration
  def change
    create_table :project_subscriptions do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
