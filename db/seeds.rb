# frozen_string_literal: true

owner = User.create! email: 'ivan@example.com'

10.times do
  owner.transactions.create! title: Faker::Games::LeagueOfLegends.quote,
                             price_cents: rand(100..100_000),
                             direction: Transaction.directions.keys.sample
end
