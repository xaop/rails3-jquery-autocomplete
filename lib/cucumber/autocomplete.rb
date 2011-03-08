Given /^I choose "([^"]*)" in the autocomplete list$/ do |text|
  page.execute_script %Q{ $('input[data-autocomplete]').trigger("focus") }
  page.execute_script %Q{ $('input[data-autocomplete]').trigger("keydown") }
  sleep 1
  page.execute_script %Q{ $('.ui-menu-item a:contains("#{text}")').trigger("mouseenter").trigger("click"); }
end

Then /^I should (see|not see) "([^"]+)" in the autocomplete list$/ do |see_or_not, text|
  Then "I should #{see_or_not} \"#{text}\" within \"ul.ui-autocomplete.ui-menu\""
end
