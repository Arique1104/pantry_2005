class CookBook
 attr_reader  :recipes, :date
  def initialize
    @recipes = []
    @date = Date.today.strftime("%m-%d-%Y")
  end

  def add_recipe(recipe)
    @recipes << recipe

  end

  def ingredients
    items = []
    @recipes.each do |recipe|
      recipe.ingredients.each do |ingredient|
      items << ingredient.name
      end
    end
    items.uniq
  end

  def highest_calorie_meal
    @recipes.max_by do |recipe|
      recipe.total_calories
    end
  end

  def summary
    @all_recipes = []
    @recipes.each do |recipe|
      recipe.ingredients_required.each do |ingredient, amount|
    require "pry"; binding.pry
      end
    end
  end

end

#Use TDD to build a `CookBook` class that responds to the following interaction pattern.
#
# For the `summary`, ingredients are listed in order of calories. This is the amount of calories that ingredient contributes to the total calories of the recipe, not the amount of calories per single unit of the ingredient.
