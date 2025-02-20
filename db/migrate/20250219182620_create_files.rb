class CreateFiles < ActiveRecord::Migration[7.2]
  def change
    create_table :files do |t|
      t.string :name
      t.string :path

      t.references :cards, foreign_key: true, null: false, cascade: true

      t.timestamps
    end
  end
end
