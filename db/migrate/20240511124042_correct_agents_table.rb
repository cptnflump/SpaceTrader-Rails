class CorrectAgentsTable < ActiveRecord::Migration[7.1]
  def change
    add_column :agents, :account_id, :string, null: false
    add_column :agents, :headquarters, :string, null: false
    add_column :agents, :credits, :integer, null: false
    remove_column :agents, :funds, :bigint
  end
end
