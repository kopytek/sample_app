# nasz fake gem do dodawania userow do bazy danych

require 'faker'

namespace :db do
  desc 'wypelniamy nasza baze rekordami'
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    admin = User.create!(:name => 'foo',
                :email => 'tylkonieto1@mail.com',
                :password => 'foobar',
                :password_confirmation => 'foobar')
    admin.toggle!(:admin)            
    99.times do |n|
      name  = Faker::Name.name
      email = "mail#{n+1}@mail.com"
      password = 'foobar'
      User.create!(:name => name,
                   :email => email,
                   :password => password,
                   :password_confirmation => password)
    end
  end
end

