require('pry-byebug')
require_relative('models/bounty_hunting.rb')

BountyHunting.delete_all

target1 = BountyHunting.new({
  "name" => "TERGERN",
  "danger_level" => "ERMAHGERDYERDERD",
  "species" => "human",
  "favourite_weapon" => "plane",
  "last_known_location" => "NASA"
  })

target2 = BountyHunting.new({
  "name" => "Will",
  "danger_level" => "insignificant",
  "species" => "unknown",
  "favourite_weapon" => "Greggs steak slice",
  "last_known_location" => "Greggs"
  })

target1.save
target2.save

target1.favourite_weapon = "hacksaw"

target1.update()

target2.favourite_weapon = "nail gun"
target2.name = "Will Wobertson"
target2.update

targets = BountyHunting.all()
# target1.delete

# BountyHunting.delete(1)

binding.pry
nil