# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
  User.create(first_name:'John', last_name:'Doe', email:'john@gmail.com', location:'Chicago', state:'IL', password:'asdfasdf', password_confirmation:'asdfasdf')
  User.create(first_name:'James', last_name:'Doe', email:'james@gmail.com', location:'Chicago', state:'IL', password:'asdfasdf', password_confirmation:'asdfasdf')
  User.create(first_name:'Jack', last_name:'Doe', email:'jack@gmail.com', location:'Chicago', state:'IL', password:'asdfasdf', password_confirmation:'asdfasdf')

  Event.create(name:'pizza party', location:'Chicago', state:'IL', date:Date.new, user_id:1)
  Event.create(name:'perogi party', location:'Springfield', state:'IL', date:Date.new, user_id:2)
  Event.create(name:'pastrami party', location:'Franklin Park', state:'IL', date:Date.new, user_id:3)
