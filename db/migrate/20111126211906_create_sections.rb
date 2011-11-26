class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :page_id
      t.string :name
      t.string :content

      t.timestamps
    end
  end
end
