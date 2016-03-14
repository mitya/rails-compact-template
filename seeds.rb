require './app'

# db = SQLite3::Database.new(db_path)
# db.execute "drop table users;"  rescue nil # maybe it didn't exist!
# db.execute "create table users (id integer primary key autoincrement, email varchar(100), server_id integer);"

ActiveRecord::Schema.define(version: 1) do
  create_table :users, force: true do |t|
    t.string :email
    t.datetime :created_at
  end

  create_table :posts, force: true do |t|
    t.string :title
    t.text :content
    t.integer :user_id
    t.datetime :created_at
    t.datetime :updated_at
  end
end

u1 = User.create! email: 'user1@demo.com'
u2 = User.create! email: 'user2@demo.com'
Post.create! title: 'Post 1', content: 'blah blah blah', user_id: u1.id
