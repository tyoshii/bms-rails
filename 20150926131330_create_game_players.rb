class CreateGamePlayers < ActiveRecord::Migration
  def change
    create_table :game_players do |t|
      # meta（この4カラムでユニーク）
      t.integer :game_id
      t.integer :team_id
      t.integer :player_id
      t.string :stats_type # hitting/pitching

      # 出場選手
      t.integer :order
      t.integer :disporder
      t.boolean :is_starter
      t.text :position

      # 個人成績
      t.integer :TPA
      t.integer :AB
      t.integer :H
      t.integer :H2
      t.integer :H3
      t.integer :HR
      t.integer :SO
      t.integer :MSO
      t.integer :BB
      t.integer :HBP
      t.integer :SAC
      t.integer :SF
      t.integer :RBI
      t.integer :R
      t.integer :SB
      t.integer :E
      t.integer :W
      t.integer :L
      t.integer :HLD
      t.integer :SV
      t.integer :IP
      t.integer :IP_frac
      t.integer :ER

      # 表彰選手
      t.integer :mvp

      t.timestamps null: false
    end
  end
end
