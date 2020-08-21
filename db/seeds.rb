require 'open-uri'

puts "Cleaning database..."
Ingredient.destroy_all
Cocktail.destroy_all
Dose.destroy_all

puts "Creating ingredients and cocktails..."

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"
ingredients = JSON.parse(open(url).read)
ingredients["drinks"].each do |ingredient|
  i = Ingredient.create(name: ingredient["strIngredient1"])
  puts "create #{i.name}"
end

puts "Finished!"
