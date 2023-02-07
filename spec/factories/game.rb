FactoryBot.define do
  factory :game do
    title { 'Game' }
    finished_at { Time.now }
  end
end
