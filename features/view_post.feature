Feature: View a post
	
	Scenario: View a post
  Given I am on the posts page
  Then I should see "Listing posts"
  When I follow "New Post"
  Then I should see "New post"
