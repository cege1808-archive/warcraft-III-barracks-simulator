class Unit

  attr_reader :health_points, :attack_power

  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end

  def is_alive?
    !is_dead?
  end


  def is_dead?
    health_points <= 0
  end

  # If self is alive and enemy is alive
  def attack!(enemy)
    if can_attack?(enemy)
      enemy.damage(self)
      true
    else
      false
    end
  end

  def can_attack?(enemy)
    is_alive? && enemy.is_alive?
  end

  def damage(enemy) 
    @health_points -= enemy.attack_power
  end

end