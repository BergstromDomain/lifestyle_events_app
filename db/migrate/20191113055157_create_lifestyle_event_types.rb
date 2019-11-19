class CreateLifestyleEventTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :lifestyle_event_types do |t|
      t.string :title

      t.timestamps
    end
  end
end
