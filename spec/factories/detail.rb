FactoryBot.define do
  factory :detail, class: 'Detail' do
    email {Faker::Internet.email }
    phone { Faker::PhoneNumber.phone_number }
    person_id { FactoryBot.create(:person).id } 
  end
end
