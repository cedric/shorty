class CreateUrls < ActiveRecord::Migration
  
  def self.up
    create_table :urls do |t|
      t.string :url, :limit => 2048
      t.string :token
      t.timestamp :created_at
    end
    # rails column sytax doesn't support character set and collation
    execute("ALTER TABLE short_urls MODIFY COLUMN token BINARY")
    add_index :urls, :url
    add_index :urls, :token
  end
  
  def self.down
    drop_table :urls
  end
  
end
