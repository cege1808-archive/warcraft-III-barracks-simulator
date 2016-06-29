class Barracks

  REQUIRED_GOLD_FOOTMAN = 135
  REQUIRED_GOLD_PEASANT = 90
  REQUIRED_FOOD_FOOTMAN = 2
  REQUIRED_FOOD_PEASANT = 5

  attr_reader :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    !(self.gold < REQUIRED_GOLD_FOOTMAN || self.food < REQUIRED_FOOD_FOOTMAN)
  end


  def train_footman
    if can_train_footman?
      @gold -= REQUIRED_GOLD_FOOTMAN
      @food -= REQUIRED_FOOD_FOOTMAN
      Footman.new
    end
  end

  def can_train_peasant?
    !(self.gold < REQUIRED_GOLD_PEASANT || self.food < REQUIRED_FOOD_PEASANT)
  end

  def train_peasant
    if can_train_peasant?
      @gold -= REQUIRED_GOLD_PEASANT
      @food -= REQUIRED_FOOD_PEASANT
      Peasant.new
    end
  end 

end
