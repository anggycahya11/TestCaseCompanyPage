Feature: [iOS] Stream Feature

	@TEST_ATI-1295 @TESTSET_ATI-1292 @CommonFeature @NotAutomated @PinSharedDetailPortfolioOnProfilePage @Positive @Stream @iOS
	Scenario: [iOS] User pin shared detail portfolio on Profile page
		Given User login using "TRADING" account
		When User delete all post using api
		And User login to securities with pin "PIN_TRADING" using api
		And User share detail portfolio using api
		And User click side profile icon
		And User click view profile
		And User click three dot in one of stream post
		And User "pin" a stream post
		Then User success "pin" post shared portfolio
		
	@TEST_ATI-3595 @TESTSET_ATI-1292 @CommonFeature @NotAutomated @PinSharedDetailPortfolioOnProfilePage @Positive @Stream @iOS
	Scenario: [iOS] User save post of shared portfolio on stream page
		Given User login using "TRADING" account
		When User delete all post using api
		And User login to securities with pin "PIN_TRADING" using api
		And User share portfolio using api
		And User click side profile icon
		And User click view profile
		And User click three dot in one of stream post
		And User click "save" stream post
		And User click "Saved" tab in profile page
		And User click three dot in one of stream post
		Then User success "save" post portfolio
		
	@TEST_ATI-4203 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario: [iOS][Manual] User create compose idea text only from profile page
		Given User login using "EMPTY_STATE_CLE" account
		When User click side profile icon
		And User click view profile
		And User click compose idea button in profile page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
	@TEST_ATI-4202 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario Outline: [iOS][Manual] User create compose idea text only from tab in profile page
		Given User login using "EMPTY_STATE_CLE" account
		When User click side profile icon
		And User click view profile
		And User click "<tab>" tab in profile page
		And User click write a post button from profile page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
			Examples:
				| tab        |
				| Ideas      |
				| Replies    |
				| Charts     |
				| Prediction |
				| Polling    |
				| Liked      |
				| Saved      |
		
	@TEST_ATI-4201 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario: [iOS][Manual] User create compose idea text only from company page (Watchlist page)
		Given User login using "EMPTY_STATE_CLE" account
		When User add stock to watchlist
		And User click stock in watchlist
		And User click compose idea button in company page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
	@TEST_ATI-4200 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario: [iOS][Manual] User create compose idea text only from stream page
		Given User login using "CLE" account
		When User click stream menu
		And User click compose idea button in stream page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
	@TEST_ATI-4199 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario: [iOS][Manual] User create compose idea text only from company page (Search page)
		Given User login using "EMPTY_STATE_CLE" account
		When User click search menu
		And User click tranding stock in search page
		And User click compose idea button in company page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
	@TEST_ATI-4198 @TESTSET_ATI-1292 @CreateComposeIdeaTextOnly @NotAutomated @Positive @Stream @iOS
	Scenario: [iOS][Manual] User create compose idea text only from profile page
		Given User login using "EMPTY_STATE_CLE" account
		When User click side profile icon
		And User click view profile
		And User click compose idea button in profile page
		And User input compose idea "Today i'm lose 1000 dollar!"
		And User click posting button
		Then User see success create compose idea
		
