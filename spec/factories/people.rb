FactoryBot.define do
  factory :person, class: 'Person' do
    title {Faker::Name.name }
    name { Faker::Name.name }
    age { Faker::Number.digit }
  end
end
