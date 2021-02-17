class Game

  RULES = {
    rock:     { rock: 'draw', paper: 'lose', scissors: 'win' },
    paper:    { rock: 'win', paper: 'draw', scissors: 'lose' },
    scissors: { rock: 'lose', paper: 'win', scissors: 'draw' }
  }

  def initialize(players:)
    @player_one = players[0]
    @player_two = assign(players[1])
    @player_one_weapon = nil
    @player_two_weapon = nil
  end

  def player_weapon=(weapon)
    if @player_one_weapon.nil?
      @player_one_weapon = weapon.downcase.to_sym
    elsif two_player_game? && @player_two_weapon.nil?
      @player_two_weapon = weapon.downcase.to_sym
    end
  end

  def outcome
    if one_player_game?
      make_computer_choice! 
      "You #{RULES[@player_one_weapon][@player_two_weapon]}, #{@player_one}!"
    else
      "You #{RULES[@player_one_weapon][@player_two_weapon]}, #{@player_one}!\n" +
      "You #{RULES[@player_two_weapon][@player_one_weapon]}, #{@player_two}!"
    end
  end

  def current_player
    return @player_one if @player_one_weapon.nil?
    return @player_two if @player_two_weapon.nil?
  end

  def pending_weapon_choice?
    @player_one_weapon.nil? || ( two_player_game? && @player_two_weapon.nil? )
  end

  private

  def assign(player)
    if player.nil? || player.empty?
      'Computer'
    else
      player
    end
  end

  def make_computer_choice!
    @player_two_weapon = RULES.keys.sample
  end

  def one_player_game?
    @player_two == 'Computer'
  end

  def two_player_game?
    @player_two != 'Computer'
  end
end