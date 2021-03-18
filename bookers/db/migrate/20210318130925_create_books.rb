class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :本のタイトル
      t.text :感想

      t.timestamps
    end
  end
end
