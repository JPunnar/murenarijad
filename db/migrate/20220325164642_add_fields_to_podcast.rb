class AddFieldsToPodcast < ActiveRecord::Migration[7.0]
  def change
    add_column :podcasts, :title, :string
    add_column :podcasts, :description, :string
    add_column :podcasts, :number, :integer
  end
end
