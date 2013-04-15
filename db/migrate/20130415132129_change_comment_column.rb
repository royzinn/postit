class ChangeCommentColumn < ActiveRecord::Migration
  def up
  	change_column :comments, :body, :text
  end

  def down
  end
end
