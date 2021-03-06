class CreateStories < ActiveRecord::Migration
  def self.up
    create_table :stories do |t|
      t.references :project
      t.string :title
      t.text :description
      t.references :actor
      t.timestamps
    end
  end

  def self.down
    drop_table :stories
  end
end
