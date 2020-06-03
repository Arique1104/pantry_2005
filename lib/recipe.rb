class Recipe
 attr_reader  :name,
              :ingredients_required
  def initialize(recipe_name)
    @name = recipe_name
    @ingredients_required = Hash.new{0}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] += amount
  end

  def ingredients
    @ingredients_required.keys
  end

  def total_calories
    @calories = 0
    ingredients.each do |ingredient|
      @calories += ingredient.calories * @ingredients_required[ingredient]
    end
    @calories
  end

end
