class CreateCards < ActiveRecord::Migration[7.2]
  def change
    create_table :cards do |t|
      t.string :title
      t.string :description

      t.belongs_to :user, foreign_key: true, null: false
      t.belongs_to :collection, foreign_key: true, null: false

      t.timestamps
    end
  end
end
