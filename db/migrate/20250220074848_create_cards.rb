class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description

      t.references :users, foreign_key: true, null: false, cascade: true
      t.references :collections, foreign_key: true, null: false

      t.timestamps
    end
  end
end
