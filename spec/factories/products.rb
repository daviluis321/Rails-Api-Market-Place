FactoryBot.define do
  factory :product do
    title { "Teste" }
    price {2.3}
    published { false }
    user
  end
end
