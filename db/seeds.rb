# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.destroy_all

cat1 = Cat.new(birth_date: Time.now, color: "black", name: "Aragorn", sex: "M", description: "Strider the ranger cat")
cat2 = Cat.new(birth_date: 4.days.ago, color: "tabby", name: "Legolas", sex: "M", description: "The expert archery cat")
cat3 = Cat.new(birth_date: 10.years.ago, color: "tortoishell", name: "Frodo", sex: "M", description: "The hero cat")

cat1.save!
cat2.save!
cat3.save!
