class Game
  attr_reader :output

  def initialize(output=STDOUT)
    @players = nil
    @winner = nil
    @output = output
  end

  def call(bt_width, bt_height, ship_count, ship_info)
    winner_name = play(bt_width, bt_height, ship_count, ship_info)
    output.puts("******* #{winner_name} wins the game *******") if winner_name
  end

  def play(bt_height, bt_width, ship_count, ship_cordinates)
    output.puts('Starting Game')
    setup(bt_height, bt_width, ship_count, ship_cordinates)
    fight()
    return @winner.name if @winner
  end

  def get_players(bt_width = nil, bt_height = nil)
    return @players if @players
    p1, p2 = [1, 2].map { |i| Player.new("Player #{i}", bt_width, bt_height, @output) }
    p1.enemy = p2
    p2.enemy = p1
    @players = [p1, p2]
  end

  def setup(bt_height, bt_width, ship_count, ship_info)
    all_players = get_players(bt_width, bt_height)
    ship_info.each do |ship_detail|
      ship_type = ship_detail.shift
      len = ship_detail.shift
      width = ship_detail.shift
      all_players.each do |player|
        cordinate = ship_detail.shift
        output.puts("******* Placing #{player.name} with cordinate #{cordinate} *******")
        player.setup(ship_type, len, width, cordinate)
      end
    end
    all_players.each do |player|
      output.puts "#{player.name} Total strength: #{player.total_strength}"
    end
  end

  def get_next_player(player, damage_status, pl_missiles)
    if damage_status
      if pl_missiles[player] != nil
        next_player = player
      end
    else
      next_player = @players.select{|pl| pl!= player && pl_missiles[pl] != nil && pl_missiles[pl] != []}[0]
    end
    if next_player == nil
      next_player =  @players.select{|pl| pl_missiles[pl] != nil && pl_missiles[pl] != []}[0]
    end
    return next_player
  end

  def fight
    pl_missiles = {}
    @players.each do |player|
      @output.puts("Enter Missile location for #{player.name} space separated (for example: A1 B2 B2 B3): ");
      mis_loc_list = gets.split(" ")
      pl_missiles[player] = mis_loc_list
    end
    player = @players[0]
    loop do
      if player == nil
        output.puts("******* Draw *******")
        return
      end
      mis_list = pl_missiles[player]
      misl_position = mis_list.shift
      pl_missiles[player] = mis_list
      damage_status = player.shot(misl_position)
      output.puts("******* #{player.name} fires a missile with target #{misl_position} with hit status: #{damage_status}")
      if player.enemy.gameover?
        @winner = player
        return
      end
      player = get_next_player(player, damage_status, pl_missiles)
    end
  end
end
