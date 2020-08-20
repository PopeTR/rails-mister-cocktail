# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "Creating ingredients and cocktails..."

lemon = Ingredient.create(name: "Lemon")
ice = Ingredient.create(name: "Ice")
mint_leaves = Ingredient.create(name: "Mint Leaves")
# rum = Ingredient.create(name: "Rum")
# cointreau = Ingredient.create(name: "Cointreau")
# vodka = Ingredient.create(name: "Vodka")
rosemary = Ingredient.new(name: "Rosemary")
rosemary.save!
tomato_juice = Ingredient.new(name: "Tomato Juice")
tomato_juice.save!


mojito = Cocktail.create(name: "Mojito")
metro = Cocktail.create(name: "Metropolitan")
old_f = Cocktail.create(name: "Old Fashioned")

x = Dose.create(description: "6 leaves", cocktail_id: mojito.id, ingredient_id: mint_leaves.id)
y = Dose.create(description: "3 cubes", cocktail_id: mojito.id, ingredient_id: ice.id)
z = Dose.create(description: "1 slice", cocktail_id: mojito.id, ingredient_id: lemon.id)

[ lemon, ice, mint_leaves, rosemary, tomato_juice ].each do |ing|
  puts "Created #{ing.name}"
end

[ mojito, metro, old_f].each do |cock|
  puts "Created #{cock.name}"
end
puts "Finished!"
