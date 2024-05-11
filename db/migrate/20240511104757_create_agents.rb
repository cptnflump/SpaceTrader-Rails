class CreateAgents < ActiveRecord::Migration[7.1]
  def change
    create_table :agents, primary_key: [:symbol] do |t|
      t.string :symbol
      t.string :faction
      t.float :funds
      t.string :token
      t.timestamps
    end
  end
end
