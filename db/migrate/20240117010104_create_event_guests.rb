class CreateEventGuests < ActiveRecord::Migration[7.1]
  def change
    create_table :event_guests do |t|

      t.timestamps
    end
  end
end
