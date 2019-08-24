# frozen_string_literal: true

owner = User.create! email: 'ivan@example.com'

10.times do
  owner.transactions.create! name: Faker::Games::LeagueOfLegends.quote,
                             price_cents: rand(100..100_000)
end
