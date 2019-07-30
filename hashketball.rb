# Write your code here!

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => [{:number => 0}, {:shoe => 16}, {:points => 22}, {:rebounds => 12}, {:assists => 12}, {:steals => 3}, {:blocks => 1}, {:slam_dunks => 1}],
        "Reggie Evans" => [{:number => 30}, {:shoe => 14}, {:points => 12}, {:rebounds => 12}, {:assists => 12}, {:steals => 12}, {:blocks => 12}, {:slam_dunks => 7}],
        "Brook Lopez" => [{:number => 11}, {:shoe => 17}, {:points => 17}, {:rebounds => 19}, {:assists => 10}, {:steals => 3}, {:blocks => 1}, {:slam_dunks => 15}],
        "Mason Plumlee" => [{:number => 1}, {:shoe => 19}, {:points => 26}, {:rebounds => 11}, {:assists => 6}, {:steals => 3}, {:blocks => 8}, {:slam_dunks => 5}],
        "Jason Terry" => [{:number => 31}, {:shoe => 15}, {:points => 19}, {:rebounds => 2}, {:assists => 2}, {:steals => 4}, {:blocks => 11}, {:slam_dunks => 1}]
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => [{:number => 4}, {:shoe => 18}, {:points => 10}, {:rebounds => 1}, {:assists => 1}, {:steals => 2}, {:blocks => 7}, {:slam_dunks => 2}],
        "Bismack Biyombo" => [{:number => 0}, {:shoe => 16}, {:points => 12}, {:rebounds => 4}, {:assists => 7}, {:steals => 22}, {:blocks => 15}, {:slam_dunks => 10}],
        "DeSagna Diop" => [{:number => 2}, {:shoe => 14}, {:points => 24}, {:rebounds => 12}, {:assists => 12}, {:steals => 4}, {:blocks => 5}, {:slam_dunks => 5}],
        "Ben Gordon" => [{:number => 8}, {:shoe => 15}, {:points => 33}, {:rebounds => 3}, {:assists => 2}, {:steals => 1}, {:blocks => 1}, {:slam_dunks => 0}],
        "Kemba Walker" => [{:number => 33}, {:shoe => 15}, {:points => 6}, {:rebounds => 12}, {:assists => 12}, {:steals => 7}, {:blocks => 5}, {:slam_dunks => 12}]
      }
    }
  }
  return game_hash
end

def find_player
  game = game_hash
  result = {}
  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, scores|
          result[data_item] = scores
        end
      end
    end
  end
  return result
end

def num_points_scored(player_name)
  return find_player[player_name][2][:points]
end

def shoe_size(player_name)
  return find_player[player_name][1][:shoe]
end

def team_colors(team_name)
  game = game_hash
  result = 0
  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        result = team_data[:colors]
      end
    end
  end
  return result
end

def team_names
  game = game_hash
  result = []
  game.each do |location, team_data|
    result << team_data[:team_name]
  end
  return result
end

def player_numbers(team_name)
  game = game_hash
  result = {}
  jersey_numbers = []
  game.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team_name
        result = team_data[:players]
          result.each do |name, details|
            jersey_numbers << details[0][:number]
          end
      end
    end
  end
  return jersey_numbers
end

def player_stats(player_name)
  stats_array = find_player[player_name]
  result = {}
  stats_array.each do |list|
    list.each do |key, value|
      result[key] = value
    end
  end
  return result
end

def big_shoe_rebounds
  shoe_max_value = 0
  shoe_max_name = 0
  find_player.each do |name, player_stats|
    player_stats.each do |list|
      list.each do |key, value|
        if key == :shoe && value > shoe_max_value
          shoe_max_value = value
          shoe_max_name = name
        end
      end
    end
  end
  return find_player[shoe_max_name][3][:rebounds]
end

def most_points_scored
  points_max_value = 0
  points_max_name = 0
  find_player.each do |name, player_stats|
    player_stats.each do |list|
      list.each do |key, value|
        if key == :points && value > points_max_value
          points_max_value = value
          points_max_name = name
        end
      end
    end
  end
  return points_max_name
end
