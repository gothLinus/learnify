class CreateCollections < ActiveRecord::Migration[7.2]
  def change
    create_table :collections do |t|
      t.references :user, null: false, foreign_key: true, cascade: true

      t.timestamps
    end
  end
end
