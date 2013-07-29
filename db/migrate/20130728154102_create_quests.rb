class CreateQuests < ActiveRecord::Migration
  def change
    create_table :quests do |t|
      t.string :question
      t.text :answer

      t.timestamps
    end
  end
end
