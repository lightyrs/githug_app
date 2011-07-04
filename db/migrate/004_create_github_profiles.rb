class CreateGithubProfiles < ActiveRecord::Migration
  def self.up
    create_table :github_profiles do |t|
      t.integer :user_id
      t.string :nickname
      t.string :name
      t.string :profile_url
      t.string :blog_url
      t.string :gravatar_id
      t.string :company
      t.string :location
      t.datetime :join_date
      t.timestamps
    end
  end

  def self.down
    drop_table :github_profiles
  end
end