class CreateUserFriendships < ActiveRecord::Migration
  def change
    create_table :user_friendships do |t|

    	t.integer :user_id 
    	t.integer :friend_id
      	t.timestamps
    end

    # add 2 index columns on user_friendships by specifying the id's as an array
    add_index :user_friendships, [:user_id, :friend_id]
  end
end
