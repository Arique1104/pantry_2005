class Ingredient
 attr_reader  :name,
              :unit,
              :calories
  def initialize(ingredient_hash)
    @name = ingredient_hash[:name]
    @unit = ingredient_hash[:unit]
    @calories = ingredient_hash[:calories]

  end

end
