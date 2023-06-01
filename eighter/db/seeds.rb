# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u = User.new(id: 0,email: "sample@sample.com", username: "kanri", password: 666666)
u.save
c = Community.new(id: 0, comm_name: "main_flow", create_user_id: 0)
c.save