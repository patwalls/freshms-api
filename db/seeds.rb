# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project.create(
  title: 'Boys Dont Cry',
  link: 'http://hasitleaked.com/2015/frank-ocean-boys-dont-cry/',
  leaked: false
)

Project.create(
  title: 'Turbo Grafx 16',
  link: 'http://hasitleaked.com/2016/kanye-west-turbo-grafx-16/',
  leaked: false
)

Project.create(
  title: 'Birds in the Trap Sign McKnight',
  link: 'http://hasitleaked.com/2016/travi-scott-birds-in-the-trap-sing-mcknight/',
  leaked: false
)

Project.create(
  title: 'Blank Face',
  link: 'http://hasitleaked.com/2016/schoolboy-q-blank-face/',
  leaked: true
)

User.create(
  phone: '3076909993',
  email: 'patrickswalls@gmail.com',
  password: 'helloworld'
)

Project.all.each do |project|
  ProjectSubscription.create(
    user_id: 1,
    project_id: project.id
  )
end
