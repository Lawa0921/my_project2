class CreateWorks < ActiveRecord::Migration[6.0]
  def change
    create_table :works do |t|
      t.string :title
      t.string :name
      t.text :desc

      t.timestamps
    end
  end
end
