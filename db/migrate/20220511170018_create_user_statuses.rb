# frozen_string_literal: true

class CreateUserStatuses < ActiveRecord::Migration[7.0]
  def up
    create_table :user_statuses, id: false do |t|
      t.integer :user_id, null: false
      t.string :emoji, null: true
      t.string :description, null: false
      t.datetime :created_at, null: false
      t.datetime :ends_at, null: true
    end
    execute "ALTER TABLE user_statuses ADD PRIMARY KEY (user_id)"
  end

  def down
    drop_table :user_statuses
  end
end
