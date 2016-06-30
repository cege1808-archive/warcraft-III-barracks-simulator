class SiegeEngine < Unit

  def initialize
    super(400,50)
  end

  def can_attack?(enemy)
    is_alive? && enemy.is_alive? && (enemy.is_a?(SiegeEngine) || enemy.is_a?(Barracks)) 
  end
end

