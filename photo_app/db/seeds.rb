# Post.delete_all
# User.delete_all
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user1 = User.find_by(id: 7)
user2 = User.find_by(id: 8)
user1.posts.create(caption: "testestest", visibility: true)
user2.posts.create(caption: "melikey", visibility: true)

