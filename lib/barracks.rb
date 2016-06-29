class Barracks

  attr_reader :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    if self.gold < 135 || self.food < 2
      false
    else
      true
    end
  end


  def train_footman
    if !can_train_footman?
      nil
    else
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_peasant?
    if self.gold < 90 || self.food < 5
      false
    else
      true
    end
  end

  def train_peasant
    if !can_train_peasant?
      nil
    else
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end 

end
