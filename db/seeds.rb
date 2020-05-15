require 'json'
require 'open-uri'
require 'faker'

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
drinks_serialized = open(url).read
drinks = JSON.parse(drinks_serialized)

puts 'Creating ingredients from the JSON.'

drinks["drinks"].each do |element|
  ingredient = Ingredient.new(name: element["strIngredient1"])
  ingredient.save!
  puts "Ingredient added."
end

puts 'All ingredients added!'

puts 'Creating 20 fake virgin cocktails...'
20.times do
  cocktail = Cocktail.new(
    name: Faker::DcComics.villain
  )
  cocktail.save!
  puts 'Cocktail added.'
end
puts 'All cocktails added.'
