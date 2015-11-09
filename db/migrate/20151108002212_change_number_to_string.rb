class ChangeNumberToString < ActiveRecord::Migration
  def self.up
    change_column :cards, :number, :string
  end

  def self.down
    change_column :cards, :number, :integer
  end
end
