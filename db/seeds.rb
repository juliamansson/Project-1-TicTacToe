# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.delete_all
User.create!(first_name:"Sebastian", last_name: "Riddle", email:"sebastian@game.com", password:"password")
User.create!(first_name:"Sadiq", last_name: "Okocha", email:"sadiq@game.com", password:"password")
User.create!(first_name:"Joel", last_name: "Pickup", email:"joel@game.com", password:"password")
User.create!(first_name:"Nina", last_name: "Regli", email:"nina@game.com", password:"password")
User.create!(first_name:"Sophie",last_name: "Allaoua", email:"sophie@game.com", password:"password")
User.create!(first_name:"Tony", last_name: "Goncalves", email:"tony@game.com", password:"password")
User.create!(first_name:"Luke", last_name: "Grayland", email:"luke@game.com", password:"password")
User.create!(first_name:"Bruno", last_name: "Vinel", email:"bruno@game.com", password:"password")
User.create!(first_name:"Hannah", last_name: "Mills", email:"hannah@game.com", password:"password")
User.create!(first_name:"Lisa", last_name: "Pollack", email:"lisa@game.com", password:"password")
User.create!(first_name:"Neil", last_name: "Crosbourne", email:"neil@game.com", password:"password")
User.create!(first_name:"Rabea", last_name: "Gleissner", email:"rabea@game.com", password:"password")
User.create!(first_name:"Andres", last_name: "Vara", email:"andres@game.com", password:"password")
User.create!(first_name:"Daniel", last_name: "Easterman", email:"daniel@game.com", password:"password")
User.create!(first_name:"Julia", last_name: "Mansson", email:"julia@game.com", password:"password")
User.create!(first_name:"Michael", last_name: "Pavling", email:"michael@game.com", password:"password")
User.create!(first_name:"Jarkyn", last_name: "Soltobaeva", email:"jarkyn@game.com", password:"password")
User.create!(first_name:"Alex", last_name: "Chin", email:"alex@game.com", password:"password")
User.create!(first_name:"Johanna", last_name: "Carlberg", email:"johanna@game.com", password:"password")
User.create!(first_name:"Guy", last_name: "Routledge", email:"guy@game.com", password:"password")