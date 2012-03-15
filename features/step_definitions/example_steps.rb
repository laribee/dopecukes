require('rspec/expectations')

When /^I pass$/ do
  1.should == 1
end

Then /^I look gooooooood$/ do
  1.should == 1
end

When /^I take one step forward$/ do
  1.should == 2
end

Then /^I take two steps back$/ do
  1.should == 2
end

Given /^the following items:$/ do |table|

end