FactoryBot.define do
  factory :record_address do
    postal_code { '123-4567' }
    state_id { 1 }
    city { '東京都' }
    address { '1-1' }
    building_name { '東京ハイツ' }
    tel { '12345678910' }
  end
end
