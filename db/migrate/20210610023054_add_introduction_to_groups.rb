class AddIntroductionToGroups < ActiveRecord::Migration[5.2]
  def change
    add_column :groups, :introduction, :text
    add_column :groups, :profile_image_id, :string
  end
end
