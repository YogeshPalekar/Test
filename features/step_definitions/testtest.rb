Given(/^I have two numbers$/) do
  $number1=1
  $number2=2
end

When(/^I add those$/) do
  $number3=$number1+$number2
end

Then(/^addition result displays$/) do
  expect($number3).to eq(3)
end