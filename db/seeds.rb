# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


data_file = Rails.root.join('public/data.json')
data = File.read(data_file)
data = JSON.parse(data)

data.each do |person|
  params = { name: person['name'], age: person['info']['age'], title: person['info']['title'], details_attributes: [{email: person['info']['email'], phone: person['info']['phone']}]}
  Person.create(params) unless Person.find_by(name: params[:name])
end