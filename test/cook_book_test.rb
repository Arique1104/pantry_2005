require "minitest/autorun"
require "minitest/pride"
require "mocha/minitest"
require "./lib/ingredient"
require "./lib/pantry"
require "./lib/recipe"
require "./lib/cook_book"

class CookBookTest < Minitest::Test

  def test_it_exists
    cookbook = CookBook.new
    assert_instance_of CookBook, cookbook
  end

  def test_it_has_attributes
    cookbook = CookBook.new
    assert_equal [], cookbook.recipes

  end

  def test_it_can_add_recipes
    cookbook = CookBook.new

    recipe1 = Recipe.new("Mac and Cheese")
    recipe2 = Recipe.new("Cheese Burger")


    cookbook.add_recipe(recipe1)

    cookbook.add_recipe(recipe2)
    #
    assert_equal [recipe1, recipe2], cookbook.recipes


  end

  def test_it_can_add_calories

    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})


    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)

    recipe2.add_ingredient(ingredient3, 4)

    recipe2.add_ingredient(ingredient4, 1)


    assert_equal 440, recipe1.total_calories

    assert_equal 675, recipe2.total_calories


    cookbook.add_recipe(recipe1)

    cookbook.add_recipe(recipe2)

    assert_equal ["Cheese", "Macaroni", "Ground Beef", "Bun"], cookbook.ingredients

  end

  def test_it_can_count_the_highest_calorie

        pantry = Pantry.new
        cookbook = CookBook.new
        ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
        ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
        recipe1 = Recipe.new("Mac and Cheese")
        recipe1.add_ingredient(ingredient1, 2)
        recipe1.add_ingredient(ingredient2, 8)
        ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
        ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})


        recipe2 = Recipe.new("Cheese Burger")
        recipe2.add_ingredient(ingredient1, 2)

        recipe2.add_ingredient(ingredient3, 4)

        recipe2.add_ingredient(ingredient4, 1)


        assert_equal 440, recipe1.total_calories

        assert_equal 675, recipe2.total_calories


        cookbook.add_recipe(recipe1)

        cookbook.add_recipe(recipe2)

        assert_equal recipe2, cookbook.highest_calorie_meal
  end

  def test_it_can_restock_pantry
    pantry = Pantry.new
    cookbook = CookBook.new
    ingredient1 = Ingredient.new({name: "Cheese", unit: "C", calories: 100})
    ingredient2 = Ingredient.new({name: "Macaroni", unit: "oz", calories: 30})
    recipe1 = Recipe.new("Mac and Cheese")
    recipe1.add_ingredient(ingredient1, 2)
    recipe1.add_ingredient(ingredient2, 8)
    ingredient3 = Ingredient.new({name: "Ground Beef", unit: "oz", calories: 100})
    ingredient4 = Ingredient.new({name: "Bun", unit: "g", calories: 75})


    recipe2 = Recipe.new("Cheese Burger")
    recipe2.add_ingredient(ingredient1, 2)

    recipe2.add_ingredient(ingredient3, 4)

    recipe2.add_ingredient(ingredient4, 1)


    assert_equal 440, recipe1.total_calories

    assert_equal 675, recipe2.total_calories


    cookbook.add_recipe(recipe1)

    cookbook.add_recipe(recipe2)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal false, pantry.enough_ingredients_for?(recipe1)
  end

end

#
#
#
# # => false
#
# pantry.restock(ingredient2, 7)
#
# pantry.enough_ingredients_for?(recipe1)
# # => false
#
# pantry.restock(ingredient2, 1)
#
# pantry.enough_ingredients_for?(recipe1)
# # => true
# ```
