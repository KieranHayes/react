class AddStoryVersions < ActiveRecord::Migration
  def self.up
    Story.create_versioned_table
  end

  def self.down
    Story.drop_versioned_table
  end
end
