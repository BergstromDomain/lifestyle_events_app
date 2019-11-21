class CreateLifestyleEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :lifestyle_events do |t|
      t.string  :description
      t.date    :date
      t.integer :year
      t.integer :month
      t.integer :day

      t.timestamps
    end
  end
end
