# frozen_string_literal: true

class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.boolean :completed, null: false, default: false

      t.timestamps null: false
    end
  end
end