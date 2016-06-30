class Barracks < Unit

  REQUIRED_GOLD_FOOTMAN = 135
  REQUIRED_GOLD_PEASANT = 90
  REQUIRED_GOLD_SIEGEENGINE = 200
  REQUIRED_FOOD_FOOTMAN = 2
  REQUIRED_FOOD_PEASANT = 5
  REQUIRED_FOOD_SIEGEENGINE = 3
  REQUIRED_LUMBER_SIEGEENGINE = 60

  attr_reader :gold, :food, :lumber

  def initialize
    super(500,0)
    @gold = 1000
    @food = 80
    @lumber = 500
  end


  def damage(enemy) 
    if enemy.is_a? Footman
      @health_points -= (enemy.attack_power/2).ceil
    elsif enemy.is_a? SiegeEngine
      @health_points -= (enemy.attack_power*2)
    else
      @health_points -= enemy.attack_power
    end
  end


  def can_train_footman?
    self.gold > REQUIRED_GOLD_FOOTMAN && self.food > REQUIRED_FOOD_FOOTMAN
  end

  def train_footman
    if can_train_footman?
      @gold -= REQUIRED_GOLD_FOOTMAN
      @food -= REQUIRED_FOOD_FOOTMAN
      Footman.new
    end
  end

  def can_train_peasant?
    self.gold > REQUIRED_GOLD_PEASANT && self.food > REQUIRED_FOOD_PEASANT
  end

  def train_peasant
    if can_train_peasant?
      @gold -= REQUIRED_GOLD_PEASANT
      @food -= REQUIRED_FOOD_PEASANT
      Peasant.new
    end
  end 

  def can_create_SiegeEngine?
    self.gold > REQUIRED_GOLD_SIEGEENGINE && self.food > REQUIRED_FOOD_SIEGEENGINE && self.lumber > REQUIRED_LUMBER_SIEGEENGINE
  end

end
