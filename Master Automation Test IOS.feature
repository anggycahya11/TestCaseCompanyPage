Feature: [IOS] Automation Test

	@TEST_ATI-252 @TESTSET_ATI-251 @Automated @BlankUsernameAndPassword @CommonFeature @Login @Negative @iOS
	Scenario: [iOS] User Login with blank username and password
		Given User is on stockbit landingpage
		When User click login
		And User input username as ""
		And User input password as ""
		And User click button login
		Then User see alert "ALERT_CREDENTIALS_EMPTY" in login page
		
	@TEST_ATI-254 @TESTSET_ATI-251 @Automated @BlankPassword @CommonFeature @Login @Negative @iOS
	Scenario: [iOS] User Login with blank password
		Given User is on stockbit landingpage
		When User click login
		And User input username as "WRONG_USERNAME"
		And User input password as ""
		And User click button login
		Then User see alert "ALERT_PASSWORD_EMPTY" in login page
		
	@TEST_ATI-256 @TESTSET_ATI-251 @Automated @BlankUsername @CommonFeature @Login @Negative @iOS
	Scenario: [iOS] User Login with blank username
		Given User is on stockbit landingpage
		When User click login
		And User input username as ""
		And User input password as "WRONG_PASSWORD"
		And User click button login
		Then User see alert "ALERT_USERNAME_EMPTY" in login page
		
	@TEST_ATI-258 @TESTSET_ATI-251 @Automated @CommonFeature @Login @Negative @WrongUsernameAndPassword @iOS
	Scenario: [iOS] User Login with wrong username and password
		Given User is on stockbit landingpage
		When User click login
		And User input username as "WRONG_USERNAME"
		And User input password as "WRONG_PASSWORD"
		And User click button login
		Then User see alert "ALERT_CREDENTIALS_WRONG" in login page
		
	@TEST_ATI-269 @TESTSET_ATI-251 @Automated @CommonFeature @InputSpecialCharacter @Login @Negative @iOS
	Scenario: [iOS] User Login with input special character
		Given User is on stockbit landingpage
		When User click login
		And User input username as "~!@#$%^&*()_+{}[]''?.><,|\"
		And User input password as "~!@#$%^&*()_+{}[]''?.><,|\"
		And User click button login
		Then User see alert "ALERT_CREDENTIALS_WRONG" in login page
		
	@TEST_ATI-271 @TESTSET_ATI-251 @Automated @CommonFeature @InputOneCharacter @Login @iOS @negatis
	Scenario: [iOS] User Login with input one character
		Given User is on stockbit landingpage
		When User click login
		And User input username as "a"
		And User input password as "a"
		And User click button login
		Then User see alert "ALERT_CREDENTIALS_WRONG" in login page
		
	@TEST_ATI-273 @TESTSET_ATI-251 @Automated @CommonFeature @InputMoreThan100Character @Login @Negative @iOS
	Scenario: [iOS] User Login with input more than 100 character
		Given User is on stockbit landingpage
		When User click login
		And User input username as "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
		And User input password as "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
		And User click button login
		Then User see alert "ALERT_CREDENTIALS_WRONG" in login page
		
	@TEST_ATI-275 @TESTSET_ATI-251 @Automated @CommonFeature @Login @Negative @ShowPasswordAndHidePassword @iOS
	Scenario: [iOS] User Show Password And Hide Password
		Given User is on stockbit landingpage
		When User click login
		And User input username as "a"
		And User input password as "a"
		Then User see password is "hidden"
		And User click "show" password
		Then User see password is "shown"
		And User click "hide" password
		Then User see password is "hidden"
		
	@TEST_ATI-277 @TESTSET_ATI-251 @Automated @CommonFeature @Login @LoginAndLogout @Positive @iOS
	Scenario: [iOS] User Login stockbit and cancel Logout then logout
		Given User login using "TRADING" account
		When User click side profile icon
		And User validate "TRADING_USERNAME" is success login
		And User click log out in setting list menu
		And User click "CANCEL" in popup confirmation log out
		And User still in list menu account setting page
		And User click log out in setting list menu
		And User click "LOGOUT" in popup confirmation log out
		Then User see entry point login
		
	@TEST_ATI-279 @TESTSET_ATI-251 @Automated @CommonFeature @Login @Positive @UserGoToLoginFromRegisterPage @iOS
	Scenario: [iOS] User Go To Login From Register Page
		Given User is on stockbit landingpage
		When User click daftar
		And User click masuk sekarang in register page
		Then User see login page
		
	@TEST_ATI-281 @TESTSET_ATI-251 @Automated @CommonFeature @Login @LoginToSekuritas @Negative @WrongPIN @iOS
	Scenario: [iOS] User login to Sekuritas with wrong PIN
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "WRONG_PIN_TRADING"
		Then User still in insert pin page
		
	@TEST_ATI-297 @TESTSET_ATI-508 @Automated @CommonFeature @MainMenu @NavigateToSmartLogin @Positive @SmartLogin @iOS
	Scenario: [iOS] User navigate to Smart Login
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Smart Login" in setting list menu
		Then User see "Smart Login" setting page
		
	@TEST_ATI-301 @TESTSET_ATI-508 @Automated @Bantuan @CommonFeature @MainMenu @NavigateToBantuan @Positive @iOS
	Scenario: [iOS] User navigate to bantuan from setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Chat Support" in setting list menu
		Then User see customer support chat page
		
	@TEST_ATI-305 @TESTSET_ATI-508 @Automated @CommonFeature @DarkMode @MainMenu @Positive @SetDarkMode @iOS
	Scenario: [iOS] User set dark mode
		Given User login using "TRADING" account
		When User click side profile icon
		And User set dark mode to "Enable"
		And User see success set dark mode to "Enable"
		And User set dark mode to "Disable"
		Then User see success set dark mode to "Disable"
		
	@TEST_ATI-311 @TESTSET_ATI-310 @Automated @BlankEmail @CommonFeature @Negative @Register @iOS
	Scenario: [iOS] User Register with blank email
		Given User is on stockbit landingpage
		When User click daftar
		And User click daftar dengan email
		Then User see next button register in disabled
		
	@TEST_ATI-312 @TESTSET_ATI-310 @Automated @CommonFeature @Negative @Register @WrongEmail @iOS
	Scenario Outline: [iOS] User Register with wrong email and registered email
		Given User is on stockbit landingpage
		When User click daftar
		And User click daftar dengan email
		And User input email address "<email>"
		And User click selanjutnya
		Then User see alert "<alert>" in register page
		
			Examples:
				| alert            | email            |
				| INVALID EMAIL    | WRONG_EMAIL      |
				| REGISTERED EMAIL | REGISTERED_EMAIL |
		
	@TEST_ATI-319 @TESTSET_ATI-310 @TESTSET_ATI-2131 @Automated @CommonFeature @CreateRekeningSaham @Negative @Register @iOS
	Scenario: [iOS] User Create rekening saham
		Given User login using "NON_TRADING" account
		When User click portfolio menu
		And User click register button for create saham account
		And User see check valid "Phone Number" page
		And User click next button in check valid "phone number" page
		And User see check valid "Email" page
		And User click next button in check valid "email address" page
		And User see input otp page
		And User input otp "1111"
		Then User still in otp page
		
	@TEST_ATI-320 @TESTSET_ATI-957 @Automated @CommonFeature @CreateRekeningSaham @Positive @Register @UserChatCustomerSupportFromCreateRekeningSaham @iOS
	Scenario: [iOS] User Chat with customer support from create rekening check phone number page
		Given User login using "NON_TRADING" account
		When User click portfolio menu
		And User click register button for create saham account
		And User see check valid "Phone Number" page
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-321 @TESTSET_ATI-310 @Automated @CommonFeature @CreateRekeningSaham @Positive @Register @UserSeeUserRulesFromRegisterPage @iOS
	Scenario: [iOS] User See User Rules in register page
		Given User is on stockbit landingpage
		When User click daftar
		And User click "USER RULES" in register page
		Then User see user rules page
		
	@TEST_ATI-322 @TESTSET_ATI-310 @Automated @CommonFeature @CreateRekeningSaham @Positive @Register @UserSeePrivacyPolicyFromRegisterPage @iOS
	Scenario: [iOS] User See Privacy Policy from register page
		Given User is on stockbit landingpage
		When User click daftar
		And User click "PRIVACY POLICY" in register page
		Then User see privacy policy page
		
	@TEST_ATI-323 @TESTSET_ATI-310 @Automated @CommonFeature @CreateRekeningSaham @Positive @Register @UserGoToRegisterFromLoginPage @iOS
	Scenario: [iOS] User Go To Register From Login Page
		Given User is on stockbit landingpage
		When User click login
		And User click daftar sekarang in login page
		Then User see register page
		
	@TEST_ATI-324 @TESTSET_ATI-310 @TESTSET_ATI-2131 @Automated @CommonFeature @CreateRekeningSaham @CreateRekeningSahamWithAlreadyRegisteredPhoneNumber @Negative @Register @iOS
	Scenario: [iOS] User Create Rekening Saham With Already Registered Phone Number
		Given User login using "NON_TRADING" account
		When User click portfolio menu
		And User click register button for create saham account
		And User see check valid "Phone Number" page
		And User click "ubah nomor" in buka rekening saham page
		And User input password "NON_TRADING_PASSWORD" before change phone number
		And User click "submit" button in create trading account page
		And User input phone number "REGISTERED_TRADING_PHONE" for change phone number
		And User click "submit" button in create trading account page
		Then User still in input "phone number" in buka rekening saham page
		
	@TEST_ATI-325 @TESTSET_ATI-310 @TESTSET_ATI-2131 @Automated @CommonFeature @CreateRekeningSaham @CreateRekeningSahamWithAlreadyRegisteredEmail @Negative @Register @iOS
	Scenario: [iOS] User Create Rekening Saham With Already Registered Email
		Given User login using "NON_TRADING" account
		When User click portfolio menu
		And User click register button for create saham account
		And User see check valid "Phone Number" page
		And User click next button in check valid "phone number" page
		And User click "ubah email" in buka rekening saham page
		And User input password "NON_TRADING_PASSWORD" before change email
		And User click "submit" button in create trading account page
		And User input email "REGISTERED_EMAIL" for change email
		And User click "submit" button in create trading account page
		Then User still in input "email" in buka rekening saham page
		
	@TEST_ATI-327 @TESTSET_ATI-326 @AccessAcademyFromHamburgerMenu @Automated @CommonFeature @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] Access menu stockbit academy from research stream
		Given User login using "NON_TRADING" account
		When User click stream menu
		And User click lewati on stream popup
		And User click tab "RESEARCH" in stream page
		And User click academy entry point in stream page
		And User see stockbit academy page
		And User click resume lesson section
		Then User can watch the video while read the resume lesson
		
	@TEST_ATI-328 @TESTSET_ATI-326 @AccessAcademyFromSearchMenu @Automated @CommonFeature @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] Access menu stockbit academy sector from search menu
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click "sector" tab in explore module page
		And User click module "4" in explore module page
		And User see detail module "4" academy
		And User click play video in "module" page
		Then User see video is played
		
	@TEST_ATI-331 @TESTSET_ATI-326 @Automated @CommonFeature @PlayModuleVideo @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] User Explore Module and play module video
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Stockbit Academy" in setting list menu
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click "essential" tab in explore module page
		And User click module "1" in explore module page
		And User see detail module "1" academy
		And User click play video in "module" page
		Then User see video is played
		
	@TEST_ATI-332 @TESTSET_ATI-326 @Automated @CommonFeature @PlayChapterVideo @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] User Explore Module and play chapter video
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Stockbit Academy" in setting list menu
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click "essential" tab in explore module page
		And User click module "1" in explore module page
		And User see detail module "1" academy
		And User click chapter "1" in list chapter
		And User click play video in "chapter" page
		Then User see video is played
		
	@TEST_ATI-335 @TESTSET_ATI-326 @Automated @CommonFeature @Positive @StockbitAcademy @TakeQuizLastChapterInModule @iOS
	Scenario: [iOS][Academy] User Take Quiz from last chapter of module
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click module "1" in explore module page
		And User see detail module "1" academy
		And User click last chapter in list chapter
		And User see lessons section in chapter page
		And User click quiz chapter in end of lessons section
		And User choose answer question
		And User click see result quiz
		And User click module berikutnya button
		Then User see next module is module "2"
		
	@TEST_ATI-336 @TESTSET_ATI-326 @Automated @CommonFeature @Positive @StockbitAcademy @TakeQuizLastModuleAndLastChapter @iOS
	Scenario: [iOS][Academy] User Take Quiz from last module and last chapter
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click last module in list module
		And User click last chapter in list chapter
		And User see lessons section in chapter page
		And User click quiz chapter in end of lessons section
		And User choose answer question
		And User click see result quiz
		And User click back to main page button from stockbit academy
		Then User see stockbit academy page
		
	@TEST_ATI-365 @TESTSET_ATI-364 @AddAlert @Alert @Automated @CommonFeature @Positive @iOS
	Scenario Outline: [iOS] User Add new alert
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "<stock name>" in search text box
		And User click search stock result "<stock name>"
		And User select "<operator>" condition
		And User set "<target price>"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		Then Alert "<stock name>" saved with target "<target price>"
		
			Examples:
				| stock name | operator | target price |
				| BBSI       | =        | 1            |
				| BBCA       | <        | 1            |
				| BBRI       | ≤        | 1            |
				| BUKA       | ≥        | 123456       |
				| ADRO       | >        | 123456       |
		
	@TEST_ATI-366 @TESTSET_ATI-364 @AddAlertWithZeroInput @Alert @Automated @CommonFeature @Positive @iOS
	Scenario: [iOS] User Add new alert with zero target price
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "SGDIDR" in search text box
		And User click search stock result "SGDIDR"
		And User select "=" condition
		And User set "0"
		And User click button Set Alert
		Then User still in create price alert page
		
	@TEST_ATI-368 @TESTSET_ATI-364 @Alert @Automated @CommonFeature @EditAndDeleteAlert @Positive @iOS
	Scenario: [iOS] User Edit active Alert and Delete active alert
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "BBSI" in search text box
		And User click search stock result "BBSI"
		And User select "=" condition
		And User set "123456"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		And Alert "BBSI" saved with target "123456"
		And User click alert created
		And User change operator to "≥"
		And User change target price to "654321"
		And User click button Update Alert
		And Alert "BBSI" updated with target "654321"
		And User click alert created
		And User click delete alert
		And User click confirm delete popup alert
		Then User see empty state alert
		
	@TEST_ATI-369 @TESTSET_ATI-364 @Alert @Automated @CommonFeature @EditAlertWithZero @Positive @iOS
	Scenario: [iOS] User Edit active Alert with zero
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "BBSI" in search text box
		And User click search stock result "BBSI"
		And User select "=" condition
		And User set "123456"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		And Alert "BBSI" saved with target "123456"
		And User click alert created
		And User edit alert "BBSI"
		And User change target price to "0"
		And User change notes to " "
		And User click button Update Alert
		Then User still in edit price alert page
		
	@TEST_ATI-370 @TESTSET_ATI-364 @AddAndSubtractAlertPrice @Alert @Automated @CommonFeature @Positive @iOS
	Scenario: [iOS] User Add Subtract Alert Price
		Given User login using "TRADING" account
		When User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "SGDIDR" in search text box
		And User click search stock result "SGDIDR"
		And User set "100"
		And User click add "5" alert price
		And User click subtract "5" alert price
		Then User see final set alert price is "100.00"
		
	@TEST_ATI-371 @TESTSET_ATI-364 @Alert @Automated @CancelDeleteAlert @CommonFeature @Positive @iOS
	Scenario: [iOS] User cancel delete alert
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "BBSI" in search text box
		And User click search stock result "BBSI"
		And User select "=" condition
		And User set "1"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		And Alert "BBSI" saved with target "1"
		And User click alert created
		And User click delete alert
		And User click cancel delete popup alert
		Then User still in edit price alert page
		
	@TEST_ATI-372 @TESTSET_ATI-364 @Alert @Automated @CommonFeature @DeleteAlert @Positive @iOS
	Scenario: [iOS] User delete alert
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create Alert
		And User fill "BBSI" in search text box
		And User click search stock result "BBSI"
		And User select "=" condition
		And User set "1"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		And Alert "BBSI" saved with target "1"
		And User click alert created
		And User click delete alert
		And User click confirm delete popup alert
		Then User see empty state alert
		
	@TEST_ATI-373 @TESTSET_ATI-364 @Alert @Automated @CommonFeature @NewAlertWithExpectedCondition @Positive @iOS
	Scenario: [iOS] User Add new alert with expected condition
		Given User login using "TRADING" account
		When User delete all alert using api
		And User click search menu
		And User click Alert entry point
		And User will redirect to alert page
		And User click create new alert
		And User fill "BBCA" in search text box
		And User click search stock result "BBCA"
		And User select ">" condition
		And User set "1"
		And User fill "Alert note set"
		And User click button Set Alert
		And User click selesai button in popup success create alert
		Then User see empty state alert
		
	@TEST_ATI-375 @TESTSET_ATI-374 @Automated @BackFromEditProfile @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Edit Profile
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User click public profile
		And User click edit profile from public profile
		And User see personal detail page
		And User click back button 4 times
		Then User see watchlist page
		
	@TEST_ATI-376 @TESTSET_ATI-374 @Automated @BackFromRequestVerifiedBadge @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Request Verified Badge
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User click public profile
		And User click request verified badge
		And User see request verified badge page
		And User click next button in request verified badge page
		And User see upload foto ktp page
		And User click back button 5 times
		Then User see watchlist page
		
	@TEST_ATI-377 @TESTSET_ATI-374 @Automated @BackFromEditRegion @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Edit Region
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User click region
		And User see region page
		And User click back button 3 times
		Then User see watchlist page
		
	@TEST_ATI-378 @TESTSET_ATI-374 @Automated @BackFromEditEmail @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Edit Email
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE EMAIL" in security page
		And User see input password page
		And User input "TRADING_PASSWORD" in password page
		And User click submit button in change "email" page
		And User input new "email" as "akudikaloh11112@test.com"
		And User click submit button in change "email" page
		And User see input otp page
		And User click back button 5 times
		Then User see watchlist page
		
	@TEST_ATI-379 @TESTSET_ATI-374 @Automated @BackFromEditPhoneNumber @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Edit Phone Number
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PHONE NUMBER" in security page
		And User see input password page
		And User input "TRADING_PASSWORD" in password page
		And User click submit button in change "phone number" page
		And User click back button 4 times
		Then User see watchlist page
		
	@TEST_ATI-380 @TESTSET_ATI-374 @Automated @BackFromEditPassword @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Edit Password
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PASSWORD" in security page
		And User see input password page
		And User input "TRADING_PASSWORD" in password page
		And User click submit button in change "password" page
		And User see change password page
		And User click back button 4 times
		Then User see watchlist page
		
	@TEST_ATI-381 @TESTSET_ATI-374 @Automated @BackFromForgetPasswordInSecuritySetting @BackInteraction @CommonFeature @Positive @iOS
	Scenario Outline: [iOS] User Back From Forget Password In Security Setting
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "<change?>" in security page
		And User see input password page
		And User click forgot password
		And User see forget password send verification to email
		And User click back button 4 times
		Then User see watchlist page
		
			Examples:
				| change?             |
				| CHANGE EMAIL        |
				| CHANGE PHONE NUMBER |
				| CHANGE PASSWORD     |
		
	@TEST_ATI-382 @TESTSET_ATI-374 @Automated @BackFromLinkedAccounts @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Linked Accounts
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Linked Accounts" in setting list menu
		And User see "Linked Accounts" setting page
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-383 @TESTSET_ATI-374 @Automated @BackFromEIPOInSettingListMenu @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From EIPO In Setting List Menu
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "e-IPO" in setting list menu
		And User see "e-IPO" setting page
		And User click pelajari lebih lanjut button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User see lihat saham e-ipo button
		And User click back button 6 times
		Then User see watchlist page
		
	@TEST_ATI-384 @TESTSET_ATI-374 @Automated @BackFromEIPOInSettingListMenuListStock @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From EIPO In Setting List Menu List Stock
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "e-IPO" in setting list menu
		And User see "e-IPO" setting page
		And User click pelajari lebih lanjut button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click lihat saham button e-IPO page
		And User see list saham e-IPO
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-385 @TESTSET_ATI-374 @Automated @BackFromLinkedAccounts @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Smart Login
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Smart Login" in setting list menu
		And User see "Smart Login" setting page
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-386 @TESTSET_ATI-374 @Automated @BackFromDiscoverPeople @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Discover People
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Discover People" in setting list menu
		And User see "Discover People" setting page
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-387 @TESTSET_ATI-374 @Automated @BackFromStockbitAcademySettingListMenu @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Stockbit Academy Setting List Menu
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Stockbit Academy" in setting list menu
		And User see "Stockbit Academy" setting page
		And User click back button from stockbit academy
		Then User see watchlist page
		
	@TEST_ATI-388 @TESTSET_ATI-374 @Automated @BackFromFAQ @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From FAQ
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-389 @TESTSET_ATI-374 @Automated @BackFromBlockedUser @BackInteraction @CommonFeature @Positive @iOS
	Scenario: User Back From Blocked User
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Blocked User" in privacy setting
		And User click back button 3 times
		Then User see watchlist page
		
	@TEST_ATI-390 @TESTSET_ATI-374 @Automated @BackFromPrivacyPolicy @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Privacy Policy
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Privacy Policy" in privacy setting
		And User see "Privacy Policy" in privacy setting
		And User click back button 3 times
		Then User see watchlist page
		
	@TEST_ATI-391 @TESTSET_ATI-374 @Automated @BackFromDiscoverableByContact @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Discoverable By Contact
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Discoverable and Phone Access" in privacy setting
		And User see discoverable by contact page
		And User click back button 3 times
		Then User see watchlist page
		
	@TEST_ATI-392 @TESTSET_ATI-374 @Automated @BackFromNotification @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Notification
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Notification" in setting list menu
		And User see "Notification" setting page
		And User click back button 2 times
		Then User see watchlist page
		
	@TEST_ATI-393 @TESTSET_ATI-374 @Automated @BackFromAcademyInSearchPage @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Academy In Search Page
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click back button from stockbit academy
		Then User see search page
		
	@TEST_ATI-394 @TESTSET_ATI-374 @Automated @BackFromScreener @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Screener
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User click "Create Screener" in screener page
		And User see screener menu "Create Screener" page
		And User click back button 2 times
		Then User see search page
		
	@TEST_ATI-395 @TESTSET_ATI-374 @Automated @BackFromScreenerPreset @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Screener Preset
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User click "Guru Screener" in list preset screener
		And User click back button 2 times
		Then User see search page
		
	@TEST_ATI-396 @TESTSET_ATI-374 @Automated @BackFromFavoriteScreener @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Favorite Screener
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User click "Favorite Screener" in screener page
		Then User see screener menu "Favorite Screener" page
		And User click back button 2 times
		Then User see search page
		
	@TEST_ATI-397 @TESTSET_ATI-374 @Automated @BackFromSavedScreener @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Saved Screener
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User click "Saved Screener" in screener page
		Then User see screener menu "Saved Screener" page
		And User click back button 2 times
		Then User see search page
		
	@TEST_ATI-398 @TESTSET_ATI-374 @Automated @BackFromCreateAlert @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Create Alert
		Given User login using "TRADING" account
		When User click search menu
		And User click Alert entry point
		And User click create Alert
		And User fill "BBCA" in search text box
		And User click search stock result "BBCA"
		And User click back button 3 times
		Then User see search page
		
	@TEST_ATI-399 @TESTSET_ATI-374 @Automated @BackFromCalender @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Calender
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click back button
		Then User see search page
		
	@TEST_ATI-400 @TESTSET_ATI-374 @Automated @BackFromChat @BackInteraction @CommonFeature @Positive @iOS
	Scenario: [iOS] User Back From Chat
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click back button
		Then User see chat page
		
	@TEST_ATI-402 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonFeature @CommonOrderBuy @InitialPriceBelow200 @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy price with initial price below 200
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 1       | 5          | 0           | 6     |
			| 199     | 5          | 7           | 197   |
		
	@TEST_ATI-403 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonOrderBuy @InitialPriceBetween200And500 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy price with initial price between 200 and 500
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 200     | 5          | 0           | 210   |
			| 203     | 5          | 4           | 205   |
		
	@TEST_ATI-404 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonOrderBuy @InitialPriceBetween500And2000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy price with initial price between 500 and 2000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 500     | 5          | 0           | 525   |
			| 507     | 5          | 4           | 512   |
		
	@TEST_ATI-405 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonOrderBuy @InitialPriceBetween2000And5000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy price with initial price between 2000 and 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 2000    | 5          | 0           | 2050  |
			| 2008    | 5          | 4           | 2018  |
		
	@TEST_ATI-406 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonOrderBuy @InitialPriceAbove5000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy price with initial price above 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 5000    | 5          | 0           | 5125  |
			| 5020    | 5          | 4           | 5045  |
		
	@TEST_ATI-407 @TESTSET_ATI-401 @TESTSET_ATI-2208 @Automated @CommonOrderBuy @OnTrading @Positive @SetLotBuy @iOS
	Scenario: [iOS] [Virtual Trading] User Set buy lot and Add
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set order lot buy "1"
		And User click add "5" order lot buy
		And User click subtract "1" order lot buy
		Then User see final lot buy will be "5"
		
	@TEST_ATI-409 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @InitialPriceBelow200 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell price with initial price below 200
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		Then User set price "SELL" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 1       | 5          | 0           | 6     |
			| 199     | 5          | 7           | 197   |
		
	@TEST_ATI-410 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @InitialPriceBetween200And500 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell price with initial price between 200 and 500
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		Then User set price "SELL" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 200     | 5          | 0           | 210   |
			| 203     | 5          | 4           | 205   |
		
	@TEST_ATI-411 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @InitialPriceBetween500And2000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell price with initial price between 500 and 2000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		Then User set price "SELL" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 500     | 5          | 0           | 525   |
			| 507     | 5          | 4           | 512   |
		
	@TEST_ATI-412 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @InitialPriceBetween2000And5000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell price with initial price between 2000 and 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		Then User set price "SELL" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 2000    | 5          | 0           | 2050  |
			| 2008    | 5          | 4           | 2018  |
		
	@TEST_ATI-413 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @InitialPriceAbove5000 @OnTrading @Positive @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell price with initial price above 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		Then User set price "SELL" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 5000    | 5          | 0           | 5125  |
			| 5020    | 5          | 4           | 5045  |
		
	@TEST_ATI-414 @TESTSET_ATI-408 @TESTSET_ATI-2208 @Automated @CommonOrderSell @OnTrading @Positive @SetLotSell @iOS
	Scenario: [iOS] [Virtual Trading] User Set sell lot and Add
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User click add "2" order lot sell
		And User click subtract "1" order lot sell
		Then User see final lot sell will be "2"
		
	@TEST_ATI-416 @TESTSET_ATI-415 @Automated @CommonFeature @ForgotPassword @ForgotPasswordWithBlankEmail @Negative @iOS
	Scenario: [iOS] User forgot password with blank email
		Given User is on stockbit landingpage
		When User click login
		And User click forgot password on login page
		And User see forgot password page
		And User click next button forgot password
		Then User see alert "Email yang kamu masukkan tidak valid." in forgot password page
		
	@TEST_ATI-417 @TESTSET_ATI-415 @Automated @CommonFeature @ForgotPassword @ForgotPasswordWithInvalidEmailFormat @Negative @iOS
	Scenario Outline: [iOS] User forgot password with invalid email format
		Given User is on stockbit landingpage
		When User click login
		And User click forgot password on login page
		And User see forgot password page
		And User input email "<email format>" account forgot password
		And User click next button forgot password
		Then User see login page
		
			Examples:
				| email format                                                                                                                                                                                                                                          |
				| wrongformat                                                                                                                                                                                                                                           |
				| email.com                                                                                                                                                                                                                                             |
				| email@.com                                                                                                                                                                                                                                            |
				| !@#$%^&*(())))                                                                                                                                                                                                                                        |
				| Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. |
		
	@TEST_ATI-418 @TESTSET_ATI-415 @Automated @CommonFeature @ForgotPassword @ForgotPasswordWithNotRegisteredEmail @Negative @iOS
	Scenario: [iOS] User forgot password with not registered email
		Given User is on stockbit landingpage
		When User click login
		And User click forgot password on login page
		And User see forgot password page
		And User input email "email@not.found" account forgot password
		And User click next button forgot password
		Then User see login page
		
	@TEST_ATI-419 @TESTSET_ATI-415 @Automated @CommonFeature @ForgotPassword @ForgotPasswordFromLoginPage @Negative @iOS
	Scenario: [iOS] User forgot password from login page
		Given User is on stockbit landingpage
		When User click login
		And User click forgot password on login page
		And User see forgot password page
		And User input email "EMAIL_FORGOT_PASSWORD" account forgot password
		And User click next button forgot password
		Then User see login page
		
	@TEST_ATI-420 @TESTSET_ATI-957 @Automated @ChatWithSupportFromForgotPasswordPage @CommonFeature @ForgotPassword @Negative @iOS
	Scenario: [iOS] User chat with customer support from forgot password
		Given User is on stockbit landingpage
		When User click login
		And User click forgot password on login page
		And User see forgot password page
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-426 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @EmptyStatePortfolioTabSection @OnTrading @Portfolio @Positive @iOS
	Scenario Outline: [iOS] User see empty state in portfolio tab section
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "<tab>" tab in portfolio page
		Then User see empty state in "<tab>" tab section
		
			Examples:
				| tab       |
				| PORTFOLIO |
				| ORDER     |
				| HISTORY   |
		
	@TEST_ATI-427 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @UserGoToDiscoverNowAndPortfolio @iOS
	Scenario: [iOS] User go to deposit page from portfolio
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "PORTFOLIO" tab in portfolio page
		And User see empty state in "PORTFOLIO" tab section
		And User click "TOP UP RDN" in "PORTFOLIO" tab section
		Then User see "DEPOSIT" page from portfolio page
		
	@TEST_ATI-428 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @UserGoToWatchlist @iOS
	Scenario Outline: [iOS] User see empty state order portfolio
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User see empty state in "ORDER" tab section
		And User click "<tab>" tab in order tab section
		And User click "Open Portfolio" in "ORDER" tab section
		Then User see "Portfolio" page from portfolio page
		
			Examples:
				| tab      |
				| Order    |
				| Exercise |
		
	@TEST_ATI-429 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @UserCheckHistoryByPeriodEmptyState @iOS
	Scenario Outline: [iOS] User Check History By Period Empty State
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User click entry point period list
		And User see popup period list
		And User choose "<period>" history period list
		And User see "<period>" is success selected
		And User see empty state in "HISTORY" tab section
		And User click "Discover Now" in "HISTORY" tab section
		Then User see "Watchlist" page from portfolio page
		
			Examples:
				| period        |
				| Last 1 Month  |
				| Last 3 Months |
				| Last 1 Year   |
		
	@TEST_ATI-430 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @NonTradingUserNotSeePortfolioBalanceInProfileSetting @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User Not login to sekuritas not See Portfolio Balance In Profile Setting
		Given User login using "NON_TRADING" account
		When User click side profile icon
		Then User not see portfolio balance in account setting
		
	@TEST_ATI-431 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @TradingUserSeePortfolioBalanceInProfileSetting @iOS
	Scenario: [iOS] Trading User See Portfolio Balance In Profile Setting
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		Then User see portfolio balance in account setting
		
	@TEST_ATI-432 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @Deposit @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User Deposit from account setting
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Deposit" in account setting
		And User see deposit page
		And User choose "BCA" bank in deposit page
		And User validate "BCA" is selected
		Then User see how to deposit page
		
	@TEST_ATI-433 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @SeeRDNDepositInformation @iOS
	Scenario: [iOS] User see RDN Deposit Information
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Deposit" in account setting
		And User see deposit page
		And User click RDN Deposit Information in deposit page
		Then User see popup RDN Deposit Information
		
	@TEST_ATI-434 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @DepositFromHistoryPage @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User Deposit from history page
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "History" in account setting
		And User see history page
		And User click "Deposit" tab in history page
		And User click deposit button from history page
		And User see deposit page
		And User choose "BCA" bank in deposit page
		And User validate "BCA" is selected
		Then User see how to deposit page
		
	@TEST_ATI-435 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @NoBalanceWithdraw @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User withdraw with no balance
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Withdraw" in account setting
		And User see withdrawal page
		And User input nominal withdraw "10000000000000000"
		Then User see alert "Dana maksimal yang bisa kamu tarik Rp" in withdrawal page
		
	@TEST_ATI-436 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @NoBalanceWithdrawWithZeroNominal @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User No Balance Withdraw with zero nominal
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Withdraw" in account setting
		And User see withdrawal page
		And User input nominal withdraw "0"
		Then User see alert "Penarikan dana minimal Rp10,000" in withdrawal page
		
	@TEST_ATI-437 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @NoBalanceWithdrawAllBalance @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User withdraw all balance with no balance
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Withdraw" in account setting
		And User see withdrawal page
		And User withdraw all balance
		Then User see popup alert "Penarikan dana minimal Rp10,000" in withdrawal page
		
	@TEST_ATI-438 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @SeeHistoryFromWithdrawalPage @iOS
	Scenario: [iOS] User See History From Withdrawal Page
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		Then User see trading portfolio page
		And User click side profile icon
		And User click "Withdraw" in account setting
		Then User see withdrawal page
		And User click history button in withdrawal page
		Then User see history page
		
	@TEST_ATI-440 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @SeeEmptyStateHistoryWithdrawalPage @iOS
	Scenario Outline: [iOS] User see empty state history from withdrawal page
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "Withdraw" in account setting
		And User see withdrawal page
		And User click history button in withdrawal page
		And User see history page
		And User click "<tab>" tab in history page
		Then User see empty state "<tab>" tab section in history page
		
			Examples:
				| tab        |
				| Deposit    |
				| Withdrawal |
		
	@TEST_ATI-441 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @SeeEmptyStateHistoryAccountSettingPage @iOS
	Scenario Outline: [iOS] User see empty state history from account setting page
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click "History" in account setting
		And User see history page
		And User click "<tab>" tab in history page
		Then User see empty state "<tab>" tab section in history page
		
			Examples:
				| tab        |
				| Deposit    |
				| Withdrawal |
		
	@TEST_ATI-443 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @EditProfileFullName @Positive @Profile @iOS
	Scenario: [iOS] User Edit profile Fullname from profile page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		Then User see personal detail page
		And User edit fullname as "Dika"
		And User click button Save
		Then User validate success edit full name
		
	@TEST_ATI-444 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @EditProfileWebsite @Positive @Profile @iOS
	Scenario: [iOS] User Edit profile Website from profile page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		Then User see personal detail page
		And User edit website as "autodika.com"
		And User click button Save
		Then User validate success edit website
		
	@TEST_ATI-445 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @EditProfileBiography @Positive @Profile @iOS
	Scenario: [iOS] User Edit profile Biography from profile page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		Then User see personal detail page
		And User edit biography as "Pemain saham super"
		And User click button Save
		Then User validate success edit biography
		
	@TEST_ATI-447 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @Positive @Profile @SearchFollowers @iOS
	Scenario: [iOS] User Search followers from profile
		Given User login using "TRADING" account
		When User login using api "NON_TRADING_USERNAME" and "NON_TRADING_PASSWORD"
		And User follow "TRADING_USERNAME" using api
		And User click side profile icon
		And User click view profile
		And User click followers
		And User search follower "NON_TRADING_USERNAME" in search box
		And User click search result "NON_TRADING_USERNAME" in follower page
		Then User see "NON_TRADING_USERNAME" profile page
		
	@TEST_ATI-448 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @Positive @Profile @SearchFollowing @iOS
	Scenario: [iOS] User Search following from profile
		Given User login using "TRADING" account
		When User follow "NON_TRADING_USERNAME" using api
		And User click side profile icon
		And User click view profile
		And User click following
		And User search following "NON_TRADING_USERNAME" in search box
		And User click search result "NON_TRADING_USERNAME" in following page
		Then User see "NON_TRADING_USERNAME" profile page
		
	@TEST_ATI-449 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @Positive @Profile @SeeVerifiedBadgeUser @iOS
	Scenario: [iOS] User see verified badge user
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "USER_VERIFIED_BADGE"
		And User see username "USER_VERIFIED_BADGE" is displayed in the search result
		Then User see verified badge user profile on search
		
	@TEST_ATI-450 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @FollowUser @Positive @Profile @iOS
	Scenario: [iOS] User follow/unfollow another user
		Given User login using "TRADING" account
		When User un follow "NON_TRADING_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING_USERNAME"
		And User see username "NON_TRADING_USERNAME" is displayed in the search result
		And User click username "NON_TRADING_USERNAME" in the search result
		And User click "follow" followers contact
		And User see contact status will change into "following"
		And User click "unfollow" followers contact
		And User see contact status will change into "follow"
		Then User follow "NON_TRADING_USERNAME" using api
		
	@TEST_ATI-451 @TESTSET_ATI-442 @Automated @ChatFromProfile @CommonFeature @Positive @Profile @iOS
	Scenario: [iOS] User chat other user direct from profile
		Given User login using "NON_TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "CHAT_RECIPIENT"
		And User see username "CHAT_RECIPIENT" is displayed in the search result
		And User click username "CHAT_RECIPIENT" in the search result
		And User click chat button in profile page
		And User input random message
		And User sends chat
		Then Correct message is sent to recipient
		
	@TEST_ATI-452 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @ChatFromProfileThreeDot @CommonFeature @Positive @Profile @iOS
	Scenario: [iOS] User copy profile url
		Given User login using "NON_TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "CHAT_RECIPIENT"
		And User see username "CHAT_RECIPIENT" is displayed in the search result
		And User click username "CHAT_RECIPIENT" in the search result
		And User click three dot in profile page
		And User click "COPY PROFILE URL" in profile page
		Then User see "CHAT_RECIPIENT" profile page
		
	@TEST_ATI-453 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @Positive @Profile @TabSectionProfileEmptySectionAndSearchEmptyState @iOS
	Scenario Outline: [iOS] See tabs section empty state and Search empty state in every tab section in profile
		Given User login using "NON_TRADING2" account
		And User delete all post using api
		When User click side profile icon
		And User click view profile
		And User click "<tab>" tab in profile page
		And User see empty state tab section post in profile page
		And User search "BBCA" on tab "<tab>" in profile page
		Then User see empty state search tab section post in profile page
		
			Examples:
				| tab        |
				| Ideas      |
				| Replies    |
				| Charts     |
				| Prediction |
				| Polling    |
				| Liked      |
				| Saved      |
		
	@TEST_ATI-454 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CancelBlockUser @CommonFeature @Positive @Profile @iOS
	Scenario: [iOS] User Block User cancel block from profile page
		Given User login using "TRADING" account
		When User click search menu
		And User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING2_USERNAME"
		And User see username "NON_TRADING2_USERNAME" is displayed in the search result
		And User click username "NON_TRADING2_USERNAME" in the search result
		And User click three dot in profile page
		And User click "BLOCK" in profile page
		And User click "CANCEL" in confirmation block popup
		Then User see "NON_TRADING2_USERNAME" profile page
		
	@TEST_ATI-455 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @BlockUser @CommonFeature @Positive @Profile @iOS
	Scenario: [iOS] User Block User from profile page
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING2_USERNAME"
		And User see username "NON_TRADING2_USERNAME" is displayed in the search result
		And User click username "NON_TRADING2_USERNAME" in the search result
		And User click three dot in profile page
		And User click "BLOCK" in profile page
		And User click "BLOCK" in confirmation block popup
		Then User see info text "NON_TRADING2_USERNAME" is blocked on profile page
		
	@TEST_ATI-456 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CancelUnBlockUser @CommonFeature @Positive @Profile @iOS
	Scenario: [iOS] User Cancel UnBlock User from profile page
		Given User login using "TRADING" account
		And User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING2_USERNAME"
		And User see username "NON_TRADING2_USERNAME" is displayed in the search result
		And User click username "NON_TRADING2_USERNAME" in the search result
		And User click three dot in profile page
		And User click "BLOCK" in profile page
		And User click "BLOCK" in confirmation block popup
		And User see info text "NON_TRADING2_USERNAME" is blocked on profile page
		And User click "UNBLOCK" in profile page
		And User click "CANCEL" in confirmation unblock popup
		Then User see info text "NON_TRADING2_USERNAME" is blocked on profile page
		
	@TEST_ATI-457 @TESTSET_ATI-442 @TESTSET_ATI-2209 @Automated @CommonFeature @Positive @Profile @UnBlockUser @iOS
	Scenario: [iOS] User UnBlock User from profile page
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING2_USERNAME"
		And User see username "NON_TRADING2_USERNAME" is displayed in the search result
		And User click username "NON_TRADING2_USERNAME" in the search result
		And User click three dot in profile page
		And User click "BLOCK" in profile page
		And User click "BLOCK" in confirmation block popup
		And User see info text "NON_TRADING2_USERNAME" is blocked on profile page
		And User click "UNBLOCK" in profile page
		And User click "UNBLOCK" in confirmation unblock popup
		Then User validate success unblock user
		
	@TEST_ATI-458 @TESTSET_ATI-442 @Automated @CommonFeature @Positive @Profile @UserCancelChooseAvatar @iOS
	Scenario: [iOS] User Cancel Choose Avatar
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User click choose avatar button
		And User see popup list avatar
		And User click back from popup choose avatar
		Then User see popup choose avatar
		
	@TEST_ATI-459 @TESTSET_ATI-442 @Automated @CommonFeature @Positive @Profile @UserChooseAvatar @iOS
	Scenario: [iOS] User Choose Avatar
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User click choose avatar button
		And User see popup list avatar
		And User choose one of avatar list
		And User see checklist in avatar choosed
		And User click save avatar button
		Then User success change profile picture from "AVATAR"
		
	@TEST_ATI-460 @TESTSET_ATI-442 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @Profile @UserSwitchFromRealTradingToVirtualTrading @iOS
	Scenario: [iOS] User Switch From Real Trading To Virtual Trading
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Switch To Virtual Trading" in setting list menu
		And User see popup virtual trading entry point
		And User click go to virtual account button in popup virtual trading
		Then User see virtual trading page
		
	@TEST_ATI-461 @TESTSET_ATI-442 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @Profile @UserSwitchFromVirtualTradingToRealTrading @iOS
	Scenario: [iOS] User Switch From Virtual Trading To Real Trading
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User click side profile icon
		And User click "Switch To Real Trading" in setting list menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		Then User see trading portfolio page
		
	@TEST_ATI-462 @TESTSET_ATI-442 @Automated @CommonFeature @Positive @Profile @UserGoToWritePostFromProfile @iOS
	Scenario: [iOS] User Go To Write Post From Profile
		Given User login using "NON_TRADING2" account
		When User click side profile icon
		And User click view profile
		And User click write a post button in profile page
		Then User see compose page
		
	@TEST_ATI-464 @TESTSET_ATI-463 @Automated @CommonFeature @Positive @PresetScreener @Screener @iOS
	Scenario Outline: [iOS] User see preset screener page
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "<preset screener list>" in list preset screener
		Then User see "<preset screener list>" preset page
		
			Examples:
				| preset screener list |
				| Guru Screener        |
				| Popular              |
				| Valuation            |
				| Technical            |
				| Dividend             |
				| Fundamental          |
		
	@TEST_ATI-465 @TESTSET_ATI-463 @Automated @CommonFeature @DescriptionScreener @Positive @Screener @iOS
	Scenario: [iOS] User see Preset Screener Long Description
		Given User login using "TRADING" account
		When User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Guru Screener" in list preset screener
		And User see "Guru Screener" preset page
		And User click "Buffettology Sustainable Growth" in list preset page
		And User see "Buffettology Sustainable Growth" detail preset page
		And User click tooltips button on the right top corner
		Then User see popup description of "Buffettology Sustainable Growth"
		
	@TEST_ATI-466 @TESTSET_ATI-463 @Automated @CommonFeature @DeleteFavoriteScreener @Positive @Screener @iOS
	Scenario: [iOS] User delete favorite screener
		Given User login using "TRADING" account
		When User delete all favorite using api
		And User add to favorite using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Favorite Screener" in screener page
		And User see screener menu "Favorite Screener" page
		And User click one of the favorite screener
		And User click un favorite screener
		And User click back button 2 times
		And User click "Favorite Screener" in screener page
		And User see screener menu "Favorite Screener" page
		Then User validate success delete favorite screener
		
	@TEST_ATI-467 @TESTSET_ATI-463 @Automated @CommonFeature @Positive @Screener @SeeUnFavoriteScreener @iOS
	Scenario: [iOS] User see un favorite screener detail page
		Given User login using "TRADING" account
		When User delete all favorite using api
		And User add to favorite using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Favorite Screener" in screener page
		And User see screener menu "Favorite Screener" page
		And User click one of the favorite screener
		And User see screener result page
		And User click un favorite screener
		And User click back button 2 times
		And User click "Favorite Screener" in screener page
		And User see screener menu "Favorite Screener" page
		Then User validate success un favorite screener
		
	@TEST_ATI-468 @TESTSET_ATI-463 @Automated @CancelCreateScreener @CommonFeature @Positive @Screener @iOS
	Scenario: [iOS] User cancel create screener
		Given User login using "TRADING" account
		When User delete all Templates using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Create Screener" in screener page
		And User see screener menu "Create Screener" page
		And User input "Cancel Screener " for screener name
		And User click screen button
		And User validate screener page created
		And User click back button
		And User click "Quit" button in popup save changes screener
		Then User is on screener main page
		
	@TEST_ATI-469 @TESTSET_ATI-463 @Automated @CommonFeature @CreateScreenerBlankScreenerName @Positive @Screener @iOS
	Scenario: [iOS] User create screener blank screener name
		Given User login using "TRADING" account
		When User delete all Templates using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Create Screener" in screener page
		And User see screener menu "Create Screener" page
		And User click screen button
		Then User still in create screener page
		
	@TEST_ATI-470 @TESTSET_ATI-463 @Automated @CommonFeature @CreateScreener @Positive @Screener @iOS
	Scenario: [iOS] User success create screener
		Given User login using "TRADING" account
		When User delete all Templates using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Create Screener" in screener page
		And User see screener menu "Create Screener" page
		And User input "Screener " for screener name
		And User click add rules for screener
		And User choose rules "BASIC RATIO"
		And User choose ratio by "Size" using "Market Cap"
		And User choose "=" operator for screener
		And User input comparison number "123455"
		And User click lanjutkan button
		And User click screen button
		And User validate screener page created
		And User click save button in page screener created
		And User validate Success created screener
		And User click back button
		And User click "Saved Screener" in screener page
		And User see screener menu "Saved Screener" page
		Then User see saved screener in saved screener page
		
	@TEST_ATI-471 @TESTSET_ATI-463 @AddToFavoriteScreener @Automated @CommonFeature @Positive @Screener @iOS
	Scenario: [iOS] User success create screener and add to favorite
		Given User login using "TRADING" account
		When User delete all Templates using api
		And User click search menu
		And User click screener entry point
		And User is on screener main page
		And User click "Create Screener" in screener page
		And User see screener menu "Create Screener" page
		And User input "Screener " for screener name
		And User click add rules for screener
		And User choose rules "BASIC RATIO"
		And User choose ratio by "Size" using "Market Cap"
		And User choose "=" operator for screener
		And User input comparison number "123455"
		And User click lanjutkan button
		And User click screen button
		And User validate screener page created
		And User click save button in page screener created
		And User validate Success created screener
		And User click favorite screener
		And User click back button
		And User click "Favorite Screener" in screener page
		And User see screener menu "Favorite Screener" page
		Then User see favorite screener in favorite screener page
		
	@TEST_ATI-475 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @SearchCompany @iOS
	Scenario: [iOS] User Search company
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "STOCK_SYMBOL"
		And User see Company "STOCK_SYMBOL" is displayed in the search result
		And User click company symbol "STOCK_SYMBOL"
		Then User see "STOCK_SYMBOL" company page
		
	@TEST_ATI-476 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @SearchUser @iOS
	Scenario: [iOS] User Search User
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "NON_TRADING_USERNAME"
		And User see username "NON_TRADING_USERNAME" is displayed in the search result
		And User click username "NON_TRADING_USERNAME" in the search result
		Then User see "NON_TRADING_USERNAME" profile page
		
	@TEST_ATI-478 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @SearchCatalogProduct @iOS
	Scenario: [iOS] User Search catalog and see detail catalog stock name
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "CATALOG"
		And User see Catalog "CATALOG" is displayed in the search result
		And User click catalog "CATALOG" in the search result
		And User see "CATALOG" catalog page
		And User input "CATALOG_SYMBOL" in search stock
		And User click "CATALOG_SYMBOL" catalog stock name
		Then User see detail of "CATALOG_SYMBOL" catalog stock name
		
	@TEST_ATI-479 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @SearchInsider @iOS
	Scenario: [iOS] User Search insider
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "INSIDER"
		And User see Insider "INSIDER" is displayed in the search result
		And User click insider "INSIDER" in the search result
		Then User see "INSIDER" insider page
		
	@TEST_ATI-480 @TESTSET_ATI-474 @Automated @CommonFeature @EmptyStateSearchResult @Positive @Search @iOS
	Scenario: [iOS] User search with not found result
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "apqkdhdfdbfdshfuwghffewfbvewfhvewbndfdsvfhds"
		And User see "Tidak ada hasil yang ditemukan" in search page
		And User click "Stocks" tab in search result page
		And User see "Tidak ada hasil yang ditemukan" in search page
		And User click "People" tab in search result page
		And User see "Tidak ada hasil yang ditemukan" in search page
		And User click "Insider" tab in search result page
		Then User see "Tidak ada hasil yang ditemukan" in search page
		
	@TEST_ATI-481 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @RecentSearches @Search @iOS
	Scenario: [iOS] User View recent searches
		Given User login using "NON_TRADING" account
		When User login using "TRADING" account via api
		And User unblock all blocked list using api
		And User click search menu
		And User click search textbox
		And User input query "TRADING_USERNAME"
		And User see username "TRADING_USERNAME" is displayed in the search result
		And User click username "TRADING_USERNAME" in the search result
		And User click back button 2 times
		And User click search textbox
		And User see "TRADING_USERNAME" in recent search
		And User click "TRADING_USERNAME" in recent search
		Then User see "TRADING_USERNAME" profile page
		
	@TEST_ATI-482 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserSeeTabsInSearchPage @iOS
	Scenario: [iOS] User see tabs in search page
		Given User login using "TRADING" account
		When User click search menu
		And User see tabs in search page
		And User click "MARKET" tab in search page
		And User see "MARKET" section in search page
		And User click "GLOBAL" tab in search page
		And User see "GLOBAL" section in search page
		And User click "REKSADANA" tab in search page
		Then User see "REKSADANA" section in search page
		
	@TEST_ATI-484 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserClickSymbolInTabMarket @iOS
	Scenario: [iOS] User click symbol by tab market in search page
		Given User login using "TRADING" account
		When User click search menu
		And User see tabs in search page
		And User click "MARKET" tab in search page
		And User see "MARKET" section in search page
		And User click one of symbol in "MARKET" tab section in search page
		Then User see "SYMBOL" company page
		
	@TEST_ATI-485 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserSeeSectionInSearchPageTabMarket @iOS
	Scenario: [iOS] User See Trading Section In Search Page
		Given User login using "TRADING" account
		When User click search menu
		And User click "MARKET" tab in search page
		And User go to section "Trending" in search page
		And User see section "Trending" in search page
		And User go to section "Ranking" in search page
		And User see section "Ranking" in search page
		And User go to section "Index" in search page
		And User see section "Index" in search page
		And User go to section "Sector" in search page
		And User see section "Sector" in search page
		And User go to section "Stockbit Academy" in search page
		Then User see section "Stockbit Academy" in search page
		
	@TEST_ATI-486 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserSeeSectionInSearchPageTabGlobal @iOS
	Scenario: [iOS] User see section (Index, Commodities and Currencies) in search page
		Given User login using "TRADING" account
		When User click search menu
		And User see tabs in search page
		And User click "GLOBAL" tab in search page
		And User go to section "Index" in search page
		And User see section "Index" in search page
		And User go to section "Commodities" in search page
		And User see section "Commodities" in search page
		And User go to section "Currencies" in search page
		Then User see section "Currencies" in search page
		
	@TEST_ATI-487 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserSeeSectionInSearchPageTabReksadana @iOS
	Scenario: [iOS] User see section (Pasar Uang, Obligasi, Saham and Syariah) in search page
		Given User login using "TRADING" account
		When User click search menu
		Then User see tabs in search page
		And User click "REKSADANA" tab in search page
		And User go to section "Pasar Uang" in search page
		And User see section "Pasar Uang" in search page
		And User go to section "Obligasi" in search page
		And User see section "Obligasi" in search page
		And User go to section "Saham" in search page
		And User see section "Saham" in search page
		And User go to section "Syariah" in search page
		Then User see section "Syariah" in search page
		
	@TEST_ATI-488 @TESTSET_ATI-474 @Automated @ClearTextInSearchBox @CommonFeature @Positive @Search @iOS
	Scenario: [iOS] User Clear Text In Search Box
		Given User login using "TRADING" account
		When User click search menu
		And User click search textbox
		And User input query "NON_TRADING_USERNAME"
		And User see username "NON_TRADING_USERNAME" is displayed in the search result
		And User click clear search box
		Then User see search box is cleared
		
	@TEST_ATI-490 @TESTSET_ATI-489 @Automated @CommonFeature @CreateWatchlistGroupFromList @Positive @Watchlist @iOS
	Scenario: [iOS] User create on watchlist group list
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		Then User see new watchlist group is selected
		
	@TEST_ATI-491 @TESTSET_ATI-489 @Automated @CommonFeature @DeleteWatchlistGroupName @Positive @Watchlist @iOS
	Scenario: [iOS] User Delete watchlist group name
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User input "BRIS" in search box add symbol
		And User click "BRIS" search result symbol
		And User click back button 2 times
		And User see "BRIS" is success added
		And User delete watchlist group
		And User click delete in popup confirmation delete watchlist group
		Then User validate success delete watchlist group
		
	@TEST_ATI-492 @TESTSET_ATI-489 @AddCompanyToWatchlist @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User Add Company To Watchlist
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User input "BRIS" in search box add symbol
		And User click "BRIS" search result symbol
		And User click back button 2 times
		Then User see "BRIS" is success added
		
	@TEST_ATI-493 @TESTSET_ATI-489 @Automated @CommonFeature @DeleteCompanyToWatchlist @Positive @Watchlist @iOS
	Scenario: [iOS] User Delete Company To Watchlist
		Given User login using "TRADING" account
		When User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User input "BRIS" in search box add symbol
		And User click "BRIS" search result symbol
		And User click back button 2 times
		And User see "BRIS" is success added
		And User "DELETE" symbol in watchlist
		Then User see "BRIS" is success deleted
		
	@TEST_ATI-494 @TESTSET_ATI-489 @AddSectorSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add sector symbol
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "HEALTH" on sector section
		And User click "KLBF" on list of result search in category
		And User click back button 2 times
		Then User see "KLBF" is success added
		
	@TEST_ATI-495 @TESTSET_ATI-489 @AddIndexSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add index symbol
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "LQ45" on Index section
		And User click "BBCA" on list of result search in category
		And User click back button 2 times
		Then User see "BBCA" is success added
		
	@TEST_ATI-496 @TESTSET_ATI-489 @AddSyariahSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add syariah symbol
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "ISSI" on syariah section
		And User click "TLKM" on list of result search in category
		And User click back button 2 times
		Then User see "TLKM" is success added
		
	@TEST_ATI-497 @TESTSET_ATI-489 @AddPopularSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add popular symbol
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "Popular" symbol
		And User select one of symbol on category "POPULAR"
		And User click back button 2 times
		Then User see symbol is success added
		
	@TEST_ATI-498 @TESTSET_ATI-489 @AddForYouSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add For You symbol
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "For You" symbol
		And User select one of symbol on category "FOR YOU"
		And User click back button 2 times
		Then User see symbol is success added
		
	@TEST_ATI-499 @TESTSET_ATI-489 @AddForTrendingSymbol @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User add Trending symbol to watchlist
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click add symbol
		And User click "Trending" symbol
		And User select one of symbol on category "TRENDING"
		And User click back button 2 times
		Then User see symbol is success added
		
	@TEST_ATI-500 @TESTSET_ATI-489 @Automated @BuyUnregisSecurities @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS] User swipe and click buy (unregistered in securities)
		Given User login using "NON_TRADING" account
		When User buy "GOTO" from watchlist
		And User click demo virtual trading from watchlist
		Then User see order page symbol "GOTO"
		
	@TEST_ATI-501 @TESTSET_ATI-489 @Automated @CommonFeature @Positive @SeeWatchEmptyStateCompany @Watchlist @iOS
	Scenario: [iOS] User see watchlist with Empty State Company
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click edit watchlist group
		Then User see empty state on edit watchlist page
		
	@TEST_ATI-502 @TESTSET_ATI-489 @AddCompanyToWatchlistFromEditWatchlist @Automated @CommonFeature @Positive @Watchlist @iOS
	Scenario: [iOS]  User Add Company To Watchlist From Edit Watchlist
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click edit watchlist group
		And User see empty state on edit watchlist page
		And User click add company symbol in edit watchlist page
		And User input "BRIS" in search box add symbol
		And User click "BRIS" search result symbol
		And User click back button 2 times
		Then User see "BRIS" is success added
		
	@TEST_ATI-503 @TESTSET_ATI-489 @Automated @CommonFeature @DeleteCompanyToWatchlistFromEditWatchlist @Positive @Watchlist @iOS
	Scenario: [iOS] User Delete Company To Watchlist From Edit Watchlist
		Given User login using "TRADING" account
		When User clear watchlist group using api
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click edit watchlist group
		And User see empty state on edit watchlist page
		And User click add company symbol in edit watchlist page
		And User input "BRIS" in search box add symbol
		And User click "BRIS" search result symbol
		And User click back button 2 times
		And User see "BRIS" is success added
		And User click delete company symbol in edit watchlist page
		Then User see empty state on edit watchlist page
		
	@TEST_ATI-504 @TESTSET_ATI-489 @Automated @CommonFeature @EditWatchlistWithNullCharacter @Positive @Watchlist @iOS
	Scenario: [iOS] User Edit watchlist with null character
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User edit watchlist group name with "null" data
		Then User see alert "Nama Watchlist tidak boleh kosong" on edit watchlist page
		
	@TEST_ATI-505 @TESTSET_ATI-489 @Automated @CommonFeature @EditWatchlistWithMaksCharacter @Positive @Watchlist @iOS
	Scenario: [iOS] User Edit watchlist with max character
		Given User login using "TRADING" account
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User edit watchlist group name with "maxText" data
		Then User see alert "Nama Watchlist maksimal 25 karakter" on edit watchlist page
		
	@TEST_ATI-506 @TESTSET_ATI-489 @Automated @CommonFeature @EditWatchlist @Positive @Watchlist @iOS
	Scenario: [iOS] User Edit watchlist
		Given User login using "TRADING" account
		When User clear watchlist group using api
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User edit watchlist group name with "normal" data
		And User click save button edit watchlist
		Then User see watchlist is success edited
		
	@TEST_ATI-507 @TESTSET_ATI-489 @Automated @CommonFeature @EditSequentCompanySymbolInWatchlist @Positive @Watchlist @iOS
	Scenario Outline: [iOS] User Edit Sequent Company Symbol In Watchlist
		Given User login using "TRADING" account
		When User clear watchlist group using api
		And User click all watchlist
		And User click create new watchlist group from list
		And User input watchlist group name
		And User see new watchlist group is created
		And User close watchlist group list
		And User see new watchlist group is selected
		And User click edit watchlist group
		And User see empty state on edit watchlist page
		And User click add company symbol in edit watchlist page
		And User input "<symbol1>" in search box add symbol
		And User click "<symbol1>" search result symbol
		And User click back button
		And User input "<symbol2>" in search box add symbol
		And User click "<symbol2>" search result symbol
		And User click back button 2 times
		And User click save button edit watchlist
		And User click edit watchlist group
		And User click filter button in edit watchlist page
		And User click sort by "<sort by>" in popup sorting list
		And User click done button in popup sorting list
		Then User see "<data>" company symbol "<symbol1>" and "<symbol2>" is valid place
		
			Examples:
				| sort by                       | data                        | symbol1 | symbol2 |
				| Alphabetical                  | alphabetical                | BRIS    | BBCA    |
				| Dividend Yield                | dividend                    | BRIS    | BBCA    |
				| Volume                        | volume                      | BRIS    | BBCA    |
				| Value                         | value                       | BRIS    | BBCA    |
				| Current PE Ratio (Annualized) | annualized                  | BRIS    | BBCA    |
				| Current PE Ratio (TTM)        | Current PE Ratio (TTM)      | BRIS    | BBCA    |
				| Current Price to Book Value   | Current Price to Book Value | BRIS    | BBCA    |
				| Return on Equity (TTM)        | Return on Equity (TTM)      | BRIS    | BBCA    |
				| Market Cap                    | Market Cap                  | BRIS    | BBCA    |
		
	@TEST_ATI-509 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @EditProfileFullName @Positive @iOS
	Scenario: [iOS] User Edit profile Full Name from account setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click edit profile from public profile
		And User see personal detail page
		And User edit fullname as "Dika"
		And User click button Save
		Then User validate success edit full name
		
	@TEST_ATI-510 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @EditProfileWebsite @Positive @iOS
	Scenario: [iOS] User Edit profile Website from account setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click edit profile from public profile
		And User see personal detail page
		And User edit website as "autodika.com"
		And User click button Save
		Then User validate success edit website
		
	@TEST_ATI-511 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @EditProfileBiography @Positive @iOS
	Scenario: [iOS] User Edit profile Biography from account setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click edit profile from public profile
		And User see personal detail page
		And User edit biography as "Pemain saham super"
		And User click button Save
		Then User validate success edit biography
		
	@TEST_ATI-512 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @EditProfileGender @Positive @iOS
	Scenario: [iOS] User Edit profile Gender
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click edit profile from public profile
		And User see personal detail page
		And User edit gender
		And User click button Save
		Then User validate success edit gender
		
	@TEST_ATI-513 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @Positive @RequestVerifiedBadge @iOS
	Scenario: [iOS] User request verified badge
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click request verified badge
		And User see request verified badge page
		And User click next button in request verified badge page
		Then User see upload foto ktp page
		
	@TEST_ATI-514 @TESTSET_ATI-508 @AccountSetting @Automated @CommonFeature @PelajariLebihLanjutRequestVerifiedBadge @Positive @iOS
	Scenario: [iOS] User pelajari lebih lanjut request verified badge
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click public profile
		And User click request verified badge
		And User see request verified badge page
		And User click pelajari lebih lanjut in request verified badge page
		Then User see explanation of request verified badge
		
	@TEST_ATI-517 @TESTSET_ATI-515 @TESTSET_ATI-2130 @AmendBank @Automated @CommonFeature @Negative @OpenEditBankAccountMenuWithoutLoginSecuritas @iOS
	Scenario: [iOS] User Open edit bank account menu without loggin in securities
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		Then User not see "Ubah Rekening Bank" setting
		
	@TEST_ATI-518 @TESTSET_ATI-515 @TESTSET_ATI-2130 @AmendBank @Automated @CommonFeature @ForgotTradingPIN @Negative @iOS
	Scenario: [iOS] User forgot trading PIN with input different nik from portfolio page
		Given User login using "TRADING" account
		When User click portfolio menu
		And User click lupa pin trading
		And User input nomor ktp "NIK_INVALID"
		And User click kirim button
		Then User still in input nomor ktp page
		
	@TEST_ATI-519 @TESTSET_ATI-515 @TESTSET_ATI-2130 @AmendBank @Automated @BatalTambahRekening @OnTrading @Positive @TakeOutFeature @iOS
	Scenario: [iOS] User cancel add new bank account
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Security" in setting list menu
		And User open "Ubah Rekening Bank" in security setting
		And User input password "TRADING_PASSWORD" in security setting
		And User click submit password in setting page
		And User see Ubah Rekening Bank page
		And User click tambah rekening
		And User click batal tambah rekening
		Then User see Ubah Rekening Bank page
		
	@TEST_ATI-521 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @SeeFullCalender @iOS
	Scenario: [iOS] User see full calender
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User expand calendar section
		Then User see full expanded calender
		
	@TEST_ATI-522 @TESTSET_ATI-520 @Automated @CalendarToday @Calender @CommonFeature @Positive @iOS
	Scenario: [iOS] User see company page from today in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User see calender page
		And User click tab "TODAY" in calender page
		And User click one of symbol in tab "TODAY" section
		Then User direct to company page
		
	@TEST_ATI-523 @TESTSET_ATI-520 @Automated @Calender @CashDividend @CommonFeature @Positive @iOS
	Scenario: [iOS] User see company page from Dividend in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "DIVIDEND" in calender page
		And User click one of symbol in tab "DIVIDEND" section
		Then User direct to company page
		
	@TEST_ATI-524 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @StockSplitMenu @iOS
	Scenario: [iOS] User see company page from stock split in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "STOCK SPLIT" in calender page
		And User click one of symbol in tab "STOCK SPLIT" section
		Then User direct to company page
		
	@TEST_ATI-525 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @ReverseSplitMenu @iOS
	Scenario: [iOS] User see company page from Reverse Split in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "REVERSE SPLIT" in calender page
		And User click one of symbol in tab "REVERSE SPLIT" section
		Then User direct to company page
		
	@TEST_ATI-526 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @RightIssueMenu @iOS
	Scenario: [iOS] User see company page from Right Issue in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "RIGHT ISSUE" in calender page
		And User click one of symbol in tab "RIGHT ISSUE" section
		Then User direct to company page
		
	@TEST_ATI-527 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @WarrantMenu @iOS
	Scenario: [iOS] User see company page from Warrant in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "WARRANT" in calender page
		And User click one of symbol in tab "WARRANT" section
		Then User direct to company page
		
	@TEST_ATI-528 @TESTSET_ATI-520 @Automated @BonusMenu @Calender @CommonFeature @Positive @iOS
	Scenario: [iOS] User see company page from Bonus in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "BONUS" in calender page
		And User click one of symbol in tab "BONUS" section
		Then User direct to company page
		
	@TEST_ATI-529 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @TenderOfferMenu @iOS
	Scenario: [iOS] User see company page from Tender Offer in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "TENDER OFFER" in calender page
		And User click one of symbol in tab "TENDER OFFER" section
		Then User direct to company page
		
	@TEST_ATI-530 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @RUPSMenu @iOS
	Scenario: [iOS] User see company page from RUPS in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "RUPS" in calender page
		And User click one of symbol in tab "RUPS" section
		Then User direct to company page
		
	@TEST_ATI-531 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @Positive @PublicExposeMenu @iOS
	Scenario: [iOS] User see company page from Public Expose in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "PUBLIC EXPOSE" in calender page
		And User click one of symbol in tab "PUBLIC EXPOSE" section
		Then User direct to company page
		
	@TEST_ATI-532 @TESTSET_ATI-520 @Automated @Calender @CommonFeature @IPOMenu @Positive @iOS
	Scenario: [iOS] User see company page from IPO in calendar page
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User click tab "IPO" in calender page
		Then User see section detail ipo
		
	@TEST_ATI-534 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Negative @SearchUserNotFound @iOS
	Scenario: [iOS] User Search User Not Found
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User search user "~!@#$%^&*()_+|}|" for chat
		Then User see not results found
		
	@TEST_ATI-535 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Negative @SearchUserChatRecipientNotFound @iOS
	Scenario: [iOS] User Search User Chat Recipient Not Found
		Given User login using "TRADING" account
		When User click chat menu
		And User search chat recipient "~!@#$%^&*()_+|}|" in list chat page
		Then User see empty list chat list
		
	@TEST_ATI-536 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Positive @ValidateAfterChatUserDisplayInListChat @iOS
	Scenario: [iOS] User Validate After Chat User Display In List Chat
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User input random message
		And User sends chat
		And Correct message is sent to recipient
		And User click back button
		Then User see "NON_TRADING_USERNAME" in list chat user
		
	@TEST_ATI-537 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Positive @TextOnlyMessage @iOS
	Scenario: [iOS] User Send message with text only
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User input random message
		And User sends chat
		Then Correct message is sent to recipient
		
	@TEST_ATI-538 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @EmojiOnlyMessage @Positive @iOS
	Scenario: [iOS] User Send message with emoji only
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User click chat box
		And User open emoji menu
		And User choose first emoji
		And User sends chat
		Then Correct emoji message is sent to recipient
		
	@TEST_ATI-539 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Positive @TextAndEmojiMessage @iOS
	Scenario: [iOS] User Send message with text and emoji
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User input random message
		And User open emoji menu
		And User choose first emoji
		And User sends chat
		Then Correct message and emoji is sent to recipient
		
	@TEST_ATI-540 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @ClearChat @CommonFeature @Positive @iOS
	Scenario: [iOS] User Clear chat
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User input random message
		And User sends chat
		And Correct message is sent to recipient
		And User clears chat
		Then Chat is empty
		
	@TEST_ATI-541 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @DeleteChat @Positive @iOS
	Scenario: [iOS] User Delete chat
		Given User login using "TRADING" account
		When User click chat menu
		And User send chat to "NON_TRADING_USERNAME" using api
		And User start chat with "NON_TRADING_USERNAME"
		And User delete chat
		Then User validate chat with "NON_TRADING_USERNAME" is deleted
		
	@TEST_ATI-542 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @CancelBlockFromRoomChat @Chat @CommonFeature @Positive @iOS
	Scenario: [iOS] User Cancel Block User from room chat
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click chat menu
		And User send chat to "NON_TRADING2_USERNAME" using api
		And User start chat with "NON_TRADING2_USERNAME"
		And User "block" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Cancel" in popup block confirmation in chat room page
		Then User "not see" blocked user info in chat room page
		
	@TEST_ATI-543 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @CancelUnblockUserFromRoomChat @Chat @CommonFeature @Positive @iOS
	Scenario: [iOS] User Cancel Unblock User from room chat
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click chat menu
		And User send chat to "NON_TRADING2_USERNAME" using api
		And User start chat with "NON_TRADING2_USERNAME"
		And User "block" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Block" in popup block confirmation in chat room page
		Then User "see" blocked user info in chat room page
		And User "unblock" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Cancel" in popup block confirmation in chat room page
		Then User "see" blocked user info in chat room page
		
	@TEST_ATI-544 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @BlockAndUnblockUserFromRoomChat @Chat @CommonFeature @Positive @iOS
	Scenario: [iOS] User Un Block User from room chat
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click chat menu
		And User send chat to "NON_TRADING2_USERNAME" using api
		And User start chat with "NON_TRADING2_USERNAME"
		And User "block" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Block" in popup block confirmation in chat room page
		Then User "see" blocked user info in chat room page
		And User "unblock" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Unblock" in popup block confirmation in chat room page
		Then User "not see" blocked user info in chat room page
		
	@TEST_ATI-546 @TESTSET_ATI-545 @TESTSET_ATI-2462 @Automated @CommonFeature @Positive @SeeLaterE-IPO @e-IPO @iOS
	Scenario: [iOS] User see later e-IPO
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "e-IPO" in setting list menu
		And User see "e-IPO" setting page
		And User click pelajari lebih lanjut button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click nanti saja button in e-IPO page
		Then User see setting list page
		
	@TEST_ATI-549 @TESTSET_ATI-545 @TESTSET_ATI-2462 @Automated @ClickListSahamE-IPO @CommonFeature @Positive @e-IPO @iOS
	Scenario Outline: [iOS] User click list saham e-IPO on every tabs in e-IPO page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "e-IPO" in setting list menu
		And User see "e-IPO" setting page
		And User click pelajari lebih lanjut button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click lihat saham button e-IPO page
		And User see list saham e-IPO
		And User click "<state?>" tab in e-IPO page
		And User see list saham e-IPO state "<state?>"
		Then User click one of list symbol "<state?>" in e-IPO list
		
			Examples:
				| state?   |
				| Ongoing  |
				| Upcoming |
				| Past     |
		
	@TEST_ATI-550 @TESTSET_ATI-545 @TESTSET_ATI-2462 @Automated @ClickListSahamE-IPOFromWatchlistPage @CommonFeature @Positive @e-IPO @iOS
	Scenario: [iOS] User click list saham e-IPO from watchlist page
		Given User login using "TRADING" account
		When User click one of list symbol e-IPO list in watchlist page
		Then User see input pin trading page
		
	@TEST_ATI-552 @TESTSET_ATI-551 @Automated @CommonFeature @FAQ @Negative @SearchNotFoundFAQ @iOS
	Scenario: [iOS] User search not found FAQ
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User search "Lorem Ipsum is simply dummy text of the printing and typesetting industry." in faq page
		Then User see search not found on faq
		
	@TEST_ATI-553 @TESTSET_ATI-551 @Automated @CommonFeature @FAQ @Negative @SearchFAQWithInputSpecialCharacter @iOS
	Scenario: [iOS] User search FAQ with input special character
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User search "-/:;()$&@“‘’[]{}#%^*+=•¥£€><~|\_.,?!’" in faq page
		Then User see search not found on faq
		
	@TEST_ATI-555 @TESTSET_ATI-551 @Automated @CommonFeature @FAQ @Positive @SearchFAQ @iOS
	Scenario: [iOS] User search FAQ
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User search "Apa bedanya fitur Stockbit Basic dan Stockbit Pro" in faq page
		And User click "Apa bedanya fitur Stockbit Basic dan Stockbit Pro" in search result faq page
		Then User see faq title "Apa bedanya fitur Stockbit Basic dan Stockbit Pro" in faq page
		
	@TEST_ATI-556 @TESTSET_ATI-551 @Automated @CommonFeature @FAQ @Positive @SeeCategoryFAQ @iOS
	Scenario: [iOS] User see category FAQ
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User see section "Jelajahi Semua Kategori" in faq page
		And User click "tentang stockbit" in faq page
		Then User see detail "Apa itu Stockbit?" page faq category
		
	@TEST_ATI-557 @TESTSET_ATI-551 @Automated @ChatWithTeamFromFAQ @CommonFeature @FAQ @Positive @iOS
	Scenario: [iOS] User access chat support from faq
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User click chat dengan kami button in faq page
		Then User see chat with stockbit team page from faq
		
	@TEST_ATI-558 @TESTSET_ATI-551 @Automated @CloseFAQPage @CommonFeature @FAQ @Positive @iOS
	Scenario: [iOS] User close FAQ page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "FAQs" in setting list menu
		And User see "FAQ" setting page
		And User click back button
		Then User see account setting page displayed
		
	@TEST_ATI-560 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @LearnAboutConnectToContact @Positive @iOS
	Scenario: [iOS] User wants to learn more about connect to contact
		Given User login using "TRADING" account
		When User click side profile icon
		And User see account setting page displayed
		And User click "Discover People" in setting list menu
		And User click tab friends
		And User "DONT ALLOW" contact access in discover people page
		And User click learn more
		Then User will redirected to help page
		
	@TEST_ATI-561 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @LearnAboutConnectToContactFromDiscoverableAndPhoneAccessInPrivacySettingPage @Positive @iOS
	Scenario: [iOS] User wants to learn more about connect to contact from discoverable and phone access in privacy setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User see account setting page displayed
		And User click "Privacy" in setting list menu
		And User click "Discoverable and Phone Access" in privacy setting
		And User click learn more from discoverable and phone access in privacy setting page
		Then User will redirected to help page
		
	@TEST_ATI-562 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @Positive @SeeEmptyStateListFriend @iOS
	Scenario: [iOS] User see empty list friends
		Given User login using "TRADING" account
		When User click side profile icon
		And User see account setting page displayed
		And User click "Discover People" in setting list menu
		And User click tab friends
		And User "DONT ALLOW" contact access in discover people page
		Then User get screen notification "Temukan Temanmu di Stockbit."
		
	@TEST_ATI-563 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @NotAllowThenAllowDiscoverableByContacts @Positive @iOS
	Scenario: [iOS] User not allow then allow discoverable by contacts
		Given User login using "TRADING" account
		When User click side profile icon
		And User see account setting page displayed
		And User click "Privacy" in setting list menu
		And User click "Discoverable and Phone Access" in privacy setting
		And User "ALLOW" discoverable by contacts
		And User see status "ALLOW" for discoverable by contacts
		And User "NOT ALLOW" discoverable by contacts
		Then User see status "NOT ALLOW" for discoverable by contacts
		
	@TEST_ATI-564 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @Positive @SeeSuggestionList @iOS
	Scenario: [iOS] User see suggestion list
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Discover People" in setting list menu
		And User click tab suggestions
		Then User will see list of people in tab suggestions
		
	@TEST_ATI-565 @TESTSET_ATI-559 @Automated @CancelRemoveAllContactThenRemoveAll @CommonFeature @FriendDiscovery @Positive @iOS
	Scenario: [iOS] User Cancel remove access all contact then remove all
		Given User login using "TRADING" account
		When User click side profile icon
		And User see account setting page displayed
		And User click "Privacy" in setting list menu
		And User click "Discoverable and Phone Access" in privacy setting
		And User click remove all contacts
		And User click "CANCEL" in confirmation popup remove all contacts
		And User still in discoverable and phone access page
		And User click remove all contacts
		And User click "REMOVE" in confirmation popup remove all contacts
		Then User still in discoverable and phone access page
		
	@TEST_ATI-566 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @Positive @SeeMutualFriends @iOS
	Scenario: [iOS] User See mutual friends
		Given User login using "TRADING2" account
		When User follow "TRADING_USERNAME" using api
		And User login using "TRADING" account via api
		And User follow "NON_TRADING_USERNAME" using api
		And User click search menu
		And User click search textbox
		And User input query "NON_TRADING_USERNAME"
		And User click username "NON_TRADING_USERNAME" in the search result
		And User see "NON_TRADING_USERNAME" profile page
		And User click mutual friend
		Then User see list of mutual friends
		
	@TEST_ATI-567 @TESTSET_ATI-559 @Automated @CommonFeature @FollowAndUnFollowSuggestionFriend @FriendDiscovery @Positive @iOS
	Scenario: [iOS] User Follow and unfollow suggestion friend
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Discover People" in setting list menu
		And User click "follow" followers contact
		And User see contact status will change into "following"
		And User click "unfollow" followers contact
		Then User see contact status will change into "follow"
		
	@TEST_ATI-568 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @Positive @UnFollowFollowing @iOS
	Scenario: [iOS] User Unfollow following from list following
		Given User login using "TRADING" account
		When User follow "NON_TRADING_USERNAME" using api
		And User click side profile icon
		And User click view profile
		And User click following
		And User search following "NON_TRADING_USERNAME" in search box
		And User click "unfollow" following
		And User click back button
		And User click following
		Then User see "NON_TRADING_USERNAME" is remove from list following list
		
	@TEST_ATI-569 @TESTSET_ATI-559 @Automated @CommonFeature @FollowAndUnFollowFollowers @FriendDiscovery @Positive @iOS
	Scenario: [iOS] User Follow and Unfollow from list followers
		Given User login using "TRADING" account
		When User un follow "NON_TRADING_USERNAME" using api
		And User login using "NON_TRADING" account via api
		And User follow "TRADING_USERNAME" using api
		And User click side profile icon
		And User click view profile
		And User click followers
		And User search follower "NON_TRADING_USERNAME" in search box
		And User click "follow" follower
		And User see button change to "Following"
		And User click "unfollow" follower
		Then User see button change to "Follow"
		
	@TEST_ATI-571 @TESTSET_ATI-570 @Automated @CommonFeature @Positive @Privacy @SeeBlockedUserInBlockedUsersPage @iOS
	Scenario: [iOS] User see blocked user in Blocked Users page
		Given User login using "TRADING" account
		When User "block" username "NON_TRADING2_USERNAME" using api
		And User click side profile icon
		And User click "Privacy" in setting list menu
		And User see "Privacy" setting page
		And User click "Blocked User" in privacy setting
		And User get "data.profile.username" username "NON_TRADING2_USERNAME" using api
		And User see blocked user in blocked users page
		Then User "unblock" username "NON_TRADING2_USERNAME" using api
		
	@TEST_ATI-572 @TESTSET_ATI-570 @Automated @CommonFeature @Positive @Privacy @UnblockedUsers @iOS
	Scenario: [iOS] User unblocked user from Blocked Users page
		Given User login using "TRADING" account
		When User unblock all blocked list using api
		And User "block" username "NON_TRADING2_USERNAME" using api
		And User click side profile icon
		And User click "Privacy" in setting list menu
		And User see "Privacy" setting page
		And User click "Blocked User" in privacy setting
		And User see blocked user in blocked users page
		And User click unblock in blocked users page
		Then User see success unblocked user in blocked users page
		
	@TEST_ATI-573 @TESTSET_ATI-570 @Automated @CommonFeature @Positive @Privacy @SeePrivacyPolicy @iOS
	Scenario: [iOS] User see privacy policy from Privacy page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User see "Privacy" setting page
		And User click "Privacy Policy" in privacy setting
		Then User see "Privacy Policy" in privacy setting
		
	@TEST_ATI-574 @TESTSET_ATI-570 @Automated @CommonFeature @Positive @Privacy @SeeTermsOfUse @iOS
	Scenario: [iOS] User see terms of use from Privacy page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User see "Privacy" setting page
		And User click "Terms of Use" in privacy setting
		Then User see "Terms Of Use" in privacy setting
		
	@TEST_ATI-575 @TESTSET_ATI-570 @Automated @CommonFeature @Positive @Privacy @SeeTermsOfUseTabSection @iOS
	Scenario: [iOS] User see terms of use tab section
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User see "Privacy" setting page
		And User click "Terms of Use" in privacy setting
		And User see "Terms Of Use" in privacy setting
		And User click "About Stockbit" tab in term of use page
		And User see "About Stockbit" tab section in term of use page
		And User click "House Rules" tab in term of use page
		And User see "House Rules" tab section in term of use page
		And User click "Terms" tab in term of use page
		And User see "Terms" tab section in term of use page
		And User click "Contact" tab in term of use page
		Then User see "Contact" tab section in term of use page
		
	@TEST_ATI-577 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserOpenReports @iOS
	Scenario: [iOS] [Report] User open reports
		Given User login using "TRADING" account
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		Then User see detail report
		
	@TEST_ATI-578 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserCopyLinkReports @iOS
	Scenario: [iOS] [Report] User Copy link reports
		Given User login using "TRADING" account
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		And User see detail report
		And User click three dot in detail report
		And User click "Share to" in list action report
		And User see popup list share method
		And User click "Copy Link" button in list share method
		Then User see success "Copy Link"
		
	@TEST_ATI-580 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserCopyTextFromThreeDot @iOS
	Scenario: [iOS] [Report] User copy text from three dot list action in detail report
		Given User login using "TRADING" account
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		And User see detail report
		And User click three dot in detail report
		And User click "Copy Text" in list action report
		Then User see success "Copy Text"
		
	@TEST_ATI-581 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserSaveReportFromThreeDot @UserUnSaveReprtFromThreeDotListAction @iOS
	Scenario: [iOS] [Report] User save and un save report from three dot list action
		Given User login using "TRADING" account
		# save
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		And User see detail report
		And User click three dot in detail report
		And User click "Save" in list action report
		Then User see success "Save"
		# unsave
		And User see detail report
		When User click three dot in detail report
		And User click "Un Save" in list action report
		Then User see success "Un Save"
		
	@TEST_ATI-583 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserFollowPostFromThreeDot @iOS
	Scenario: [iOS][Reports] Follow unfollow report post
		Given User login using "TRADING" account
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		And User see detail report
		And User click three dot in detail report
		And User click "Follow Post" in list action report
		And User see success "Follow Post"
		And User click three dot in detail report
		And User click "Unfollow Post" in list action report
		Then User see success "Unfollow Post"
		
	@TEST_ATI-585 @TESTSET_ATI-576 @Automated @CommonFeature @Positive @Reports @UserReportAbuseFromThreeDot @iOS
	Scenario: [iOS][Report] User success report abuse
		Given User login using "TRADING" account
		When User get list reports using api
		And User click report button in watchlist page
		And User click one of report list
		And User see detail report
		And User click three dot in detail report
		And User click "report abuse" in list action report
		And User see report abuse page
		And User input "Report Type" as "Advertising"
		And User input "Report Reason" as "Testing report abuse"
		And User click "Confirm" button in report abuse page
		And User click "Report" button in popup report abuse page
		Then User success report abuse
		
	@TEST_ATI-587 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidCurrentPassword @Negative @Security @iOS
	Scenario Outline: [iOS] User change email input invalid current password
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "<change?>" in security page
		And User see input password page
		And User input "WRONG_PASSWORD" in password page
		And User click submit button in change "email" page
		Then User still in input password page
		
			Examples:
				| change?             |
				| CHANGE EMAIL        |
				| CHANGE PHONE NUMBER |
				| CHANGE PASSWORD     |
		
	@TEST_ATI-588 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @ForgetPasswordFromInputPasswordPage @Positive @Security @iOS
	Scenario Outline: [iOS] User Forget password From input password page
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "<change?>" in security page
		And User see input password page
		And User click forgot password
		And User see forget password send verification to email
		And User click send verification to email
		Then User see input password page
		
			Examples:
				| change?             |
				| CHANGE EMAIL        |
				| CHANGE PHONE NUMBER |
				| CHANGE PASSWORD     |
		
	@TEST_ATI-589 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputBlankEmail @Positive @Security @iOS
	Scenario: [iOS] User change email with input blank email
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE EMAIL" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "email" page
		And User input new "email" as ""
		Then User see submit button is "disable" in change email page
		
	@TEST_ATI-590 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidEmailFormat @Positive @Security @iOS
	Scenario Outline: [iOS] User change email with input invalid email format
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE EMAIL" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "email" page
		And User input new "email" as "<input?>"
		And User click submit button in change "email" page
		Then User still in "email" setting page
		
			Examples:
				| input?            |
				| invalidformat.com |
				| email             |
				| !@#$%^&*()_+      |
		
	@TEST_ATI-591 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputAlreadyRegisteredEmail @Positive @Security @iOS
	Scenario: [iOS] User change email input already registered email
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE EMAIL" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "email" page
		And User input new "email" as "dikakoko04@gmail.com"
		And User click submit button in change "email" page
		Then User still in "email" setting page
		
	@TEST_ATI-592 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidOtp @Positive @Security @iOS
	Scenario: [iOS] User change email input invalid otp
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE EMAIL" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "email" page
		And User input new "email" as "akudikaloh11112@test.com"
		And User click submit button in change "email" page
		And User see input otp page
		And User input otp "1111"
		Then User still in otp page
		
	@TEST_ATI-593 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputAlreadyRegisteredPhoneNumber @Positive @Security @iOS
	Scenario: [iOS] User change phone number input registered phone number
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PHONE NUMBER" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "phone number" page
		And User input new "phone number" as "85161530411"
		And User click submit button in change "phone number" page
		Then User still in "phone number" setting page
		
	@TEST_ATI-594 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputBlankPhoneNumber @Positive @Security @iOS
	Scenario: [iOS] User change phone number input blank phone number
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PHONE NUMBER" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "phone number" page
		Then User see submit button is "disable" in change phone number page
		
	@TEST_ATI-595 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidFormatPhoneNumber @Positive @Security @iOS
	Scenario Outline: [iOS] User change phone number input invalid format phone number
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PHONE NUMBER" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "phone number" page
		And User input new "phone number" as "<input?>"
		And User click submit button in change "phone number" page
		Then User still in "phone number" setting page
		
			Examples:
				| input?      |
				| 1234        |
				| 11111111111 |
		
	@TEST_ATI-596 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidOtp @Positive @Security @iOS
	Scenario: [iOS] User change phone number input invalid otp
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PHONE NUMBER" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "phone number" page
		And User input new "phone number" as "85161111111"
		And User click submit button in change "phone number" page
		And User see input otp page
		And User input otp "1111"
		Then User still in otp page
		
	@TEST_ATI-597 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @InputInvalidFormatPassword @Positive @Security @iOS
	Scenario: [iOS] User change password with invalid password
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PASSWORD" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "password" page
		And User still in "password" setting page
		And User input new "password" as "pass"
		And User see submit button is "disable" in change password page
		And User still in "password" setting page
		And User input new "password" as "passwordDifferent"
		And User see submit button is "enable" in change password page
		And User click submit button in change "password" page
		Then User still in "password" setting page
		
	@TEST_ATI-598 @TESTSET_ATI-586 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Security @SuccessChangePassword @iOS
	Scenario: [iOS] User success change password
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "Security" in setting list menu
		And User see "Security" setting page
		And User click "CHANGE PASSWORD" in security page
		And User see input password page
		And User input "NON_TRADING_PASSWORD" in password page
		And User click submit button in change "password" page
		And User input new "password" as "CHANGE_PASSWORD"
		And User click submit button in change "password" page
		And User see popup success change password
		And User click close popup success change password
		Then User see "Security" setting page
		
	@TEST_ATI-307 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyWitExceedTradingBalance @Negative @OnTrading @RealBuy @iOS
	Scenario: [iOS][Real Trading] User buy from watchlist with exceed trading balance
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set real order lot buy "100"
		Then User see alert "Saldo kamu tidak mencukupi" in buy order page
		
	@TEST_ATI-309 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyFromWatchlistChangeBalanceType @DepositFromBuyOrderPage @OnTrading @Positive @RealBuy @iOS
	Scenario: [iOS][Real Trading] User Open Deposit Page From Buy Order Page
		Given User login using "Trading" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set real order lot buy "100"
		And User click deposit button from buy order page
		And User see deposit page
		And User choose "BCA" bank in deposit page
		And User validate "BCA" is selected
		Then User see how to deposit page
		
	@TEST_ATI-338 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @CancelBuyOrder @OnTrading @Positive @VirtualAmendOrder @iOS
	Scenario: [iOS] User Amend Order cancel buy order With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click buy button in order page
		And User click cancel order
		Then User success cancel order "buy"
		
	@TEST_ATI-339 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @CancelVirtualAmendOrder @OnTrading @Positive @VirtualAmendOrder @iOS
	Scenario: [iOS] User Amend Order cancel amend order With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User click subtract "4" order price buy
		And User click buy button in order page
		And User click confirm order
		And User see popup success buy order
		And User click done in popup success order
		And User direct to virtual trading order page
		And User click newest order list
		And User see status order "OPEN"
		And User click "CANCEL" button order
		And User see popup confirmation to cancel order
		And User click cancel button in popup confirmation to cancel order
		Then User see status order "WITHDRAWN"
		
	@TEST_ATI-340 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @BuyVirtualAmendOrder @OnTrading @Positive @VirtualAmendOrder @iOS
	Scenario: [iOS] User Amend Order Buy With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User click subtract "4" order price buy
		And User click buy button in order page
		And User click confirm order
		And User see popup success buy order
		And User click done in popup success order
		And User direct to virtual trading order page
		And User click newest order list
		And User see status order "OPEN"
		And User click "AMEND" button order
		And User click "AMEND" button product
		And User click confirm amend order
		And User see popup success amend "BUY" order
		And User click done button in success amend "buy" order
		And User direct to virtual trading order page
		Then User see status order "AMENDED"
		
	@TEST_ATI-341 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @CancelSellOrder @OnTrading @Positive @VirtualAmendOrder @iOS
	Scenario: [iOS] User Amend Order cancel sell order With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User click sell button in order page
		And User click cancel order
		Then User success cancel order "sell"
		
	@TEST_ATI-342 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @CancelVirtualAmendOrderSell @OnTrading @Positive @VirtualAmendOrder @iOS
	Scenario: [iOS] User Cancel Amend Sell Order With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User get stock name from portfolio
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User click add "4" order price sell
		And User click sell button in order page
		And User click confirm order
		And User see popup success sell order
		And User click done in popup success order
		And User direct to virtual trading order page
		And User click newest order list
		And User see status order "OPEN"
		And User click "CANCEL" button order
		Then User see popup confirmation to cancel order
		And User click cancel button in popup confirmation to cancel order
		Then User see status order "WITHDRAWN"
		
	@TEST_ATI-343 @TESTSET_ATI-337 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @VirtualAmendOrder @VirtualAmendOrderSell @iOS
	Scenario: [iOS] User Amend Sell Order With Stockbit virtual
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User get stock name from portfolio
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User click add "4" order price sell
		And User click sell button in order page
		And User click confirm order
		And User see popup success sell order
		And User click done in popup success order
		And User direct to virtual trading order page
		And User click newest order list
		And User see status order "OPEN"
		And User click "AMEND" button order
		And User click "AMEND" button product
		And User click confirm amend order
		And User see popup success amend "BUY" order
		And User click done button in success amend "buy" order
		And User direct to virtual trading order page
		Then User see status order "AMENDED"
		
	@TEST_ATI-345 @TESTSET_ATI-344 @TESTSET_ATI-2208 @Automated @BuyFromWatchlist @OnTrading @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy from Watchlist (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set default price and lot order "BUY"
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-346 @TESTSET_ATI-344 @TESTSET_ATI-2208 @Automated @BuyFromPortfolio @OnTrading @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy from portfolio (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User see virtual trading page
		And User get stock name from portfolio
		And User click buy button in list "1"
		And User set default price and lot order "BUY"
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-347 @TESTSET_ATI-344 @TESTSET_ATI-2208 @Automated @BuyHighestThanLotTotal @OnTrading @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy more than lot total (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set order lot buy "50000"
		Then User see alert "Nilai pembelian kamu melebihi trading balance yang kamu miliki dan kamu akan menggunakan dana dari trading limit kamu." in buy order page
		
	@TEST_ATI-348 @TESTSET_ATI-344 @TESTSET_ATI-2208 @Automated @BuyHighestThanAskPrice @OnTrading @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy highest than ask price (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set price buy highest than ask price
		And User click add "1" order lot buy
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-349 @TESTSET_ATI-344 @TESTSET_ATI-2208 @Automated @BuyLowestThanAskPrice @OnTrading @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy lowest than ask price (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set price buy lowest than ask price
		And User click add "1" order lot buy
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-357 @TESTSET_ATI-356 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User get stock name from portfolio
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User set default price and lot order "SELL"
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-358 @TESTSET_ATI-356 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @SellHighestThanAskPrice @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell highest than ask price (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User set price sell highest than ask price
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-359 @TESTSET_ATI-356 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @SellLowestThanAskPrice @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell lowest than ask price (On Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User set price sell lowest than ask price
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-351 @TESTSET_ATI-350 @TESTSET_ATI-2208 @Automated @BuyFromWatchlist @OutsideTradingHour @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy from Watchlist (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-352 @TESTSET_ATI-350 @TESTSET_ATI-2208 @Automated @BuyFromPortfolio @OutsideTradingHour @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy from portfolio (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User see virtual trading page
		And User click buy button in list "2"
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-353 @TESTSET_ATI-350 @TESTSET_ATI-2208 @Automated @BuyHighestThanLotTotal @OutsideTradingHour @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy highest than lot total (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set order lot buy "50000"
		Then User see alert "Nilai pembelian kamu melebihi trading balance yang kamu miliki dan kamu akan menggunakan dana dari trading limit kamu." in buy order page
		
	@TEST_ATI-354 @TESTSET_ATI-350 @TESTSET_ATI-2208 @Automated @BuyHighestThanAskPrice @OutsideTradingHour @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy highest than ask price (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set price buy highest than ask price
		And User click add "1" order lot buy
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-355 @TESTSET_ATI-350 @TESTSET_ATI-2208 @Automated @BuyLowestThanAskPrice @OutsideTradingHour @Positive @VirtualBuy @iOS
	Scenario: [iOS] User Virtual buy lowest than ask price (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User set price buy lowest than ask price
		And User click add "1" order lot buy
		And User click buy button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-361 @TESTSET_ATI-360 @TESTSET_ATI-2208 @Automated @OutsideTradingHour @Positive @SellOnOutSideTradingHour @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-362 @TESTSET_ATI-360 @TESTSET_ATI-2208 @Automated @OutsideTradingHour @Positive @SellHighestThanAskPrice @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell highest than ask price (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User set price sell highest than ask price
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-363 @TESTSET_ATI-360 @TESTSET_ATI-2208 @Automated @OutsideTradingHour @Positive @SellLowestThanAskPrice @VirtualSell @iOS
	Scenario: [iOS] User Virtual sell lowest than ask price (Outside Trading)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click one of portfolio list
		And User click sell button in portfolio page
		And User set order lot sell "1"
		And User set price sell lowest than ask price
		And User click sell button in order page
		And User click confirm order
		And User click done in popup success order
		Then User see status order "REJECTED"
		
	@TEST_ATI-606 @TESTSET_ATI-251 @Automated @Login @LoginToSekuritasAndLogoutFromSekuritas @OnTrading @Positive @iOS
	Scenario: [iOS] User Success login to Sekuritas and log out from stockbit
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User see trading portfolio page
		And User click side profile icon
		And User click log out in setting list menu
		And User click log out from "STOCKBIT"
		And User click "LOGOUT" in popup confirmation log out
		Then User see entry point login
		
	@TEST_ATI-607 @TESTSET_ATI-251 @Automated @Login @LoginToSekuritasAndLogoutFromSekuritas @OnTrading @Positive @iOS
	Scenario: [iOS] User Success login to Sekuritas and log out from sekuritas
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		Then User see trading portfolio page
		And User click side profile icon
		And User click log out in setting list menu
		And User click log out from "STOCKBIT SEKURITAS"
		And User click portfolio menu
		Then User see input pin trading page
		
	@TEST_ATI-918 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @InitialPriceBelow200 @OnTrading @Positive @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set price with initial price below 200
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "REAL BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 1       | 5          | 0           | 6     |
			| 199     | 5          | 7           | 197   |
		
	@TEST_ATI-919 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @InitialPriceBetween200And500 @OnTrading @Positive @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set price with initial price between 200 and 500
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "REAL BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 200     | 5          | 0           | 210   |
			| 203     | 5          | 4           | 205   |
		
	@TEST_ATI-920 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @InitialPriceBetween500And2000 @OnTrading @Positive @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set price with initial price between 500 and 2000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "REAL BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 500     | 5          | 0           | 525   |
			| 507     | 5          | 4           | 512   |
		
	@TEST_ATI-921 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @InitialPriceBetween2000And5000 @OnTrading @Positive @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set price with initial price between 2000 and 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "REAL BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 2000    | 5          | 0           | 2050  |
			| 2008    | 5          | 4           | 2018  |
		
	@TEST_ATI-922 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @InitialPriceAbove5000 @OnTrading @Positive @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set price with initial price above 5000
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		Then User set price "REAL BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 5000    | 5          | 0           | 5125  |
			| 5020    | 5          | 4           | 5045  |
		
	@TEST_ATI-923 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @OnTrading @Positive @SetLotBuy @SetPrice @iOS
	Scenario: [iOS] [Real Trading] Set lot and Add buy order
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User set real order lot buy "1"
		And User click add "5" order lot buy
		And User click subtract "1" order lot buy
		Then User see final lot real buy will be "5"
		
	@TEST_ATI-936 @TESTSET_ATI-508 @Account @Automated @MainMenu @NavigateToAccountRequestVerifiedBadge @Positive @iOS
	Scenario: [iOS] User navigate to account region
		Given User login using "TRADING" account
		And User click side profile icon
		And User click "Account" in setting list menu
		And User see "Account" setting page
		And User click region
		Then User see region page
		
	@TEST_ATI-937 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @CommonFeature @Positive @UnblockUser @iOS
	Scenario: [iOS] User Block user from room chat
		Given User login using "TRADING" account
		When User "unblock" username "NON_TRADING2_USERNAME" using api
		And User click chat menu
		And User send chat to "NON_TRADING2_USERNAME" using api
		And User start chat with "NON_TRADING2_USERNAME"
		And User "block" username "NON_TRADING2_USERNAME" in chat room page
		And User click "Block" in popup block confirmation in chat room page
		Then User "see" blocked user info in chat room page
		
	@TEST_ATI-973 @TESTSET_ATI-957 @Automated @ChatWithCustomerSupport @ChatWithCustomerSupportFromRegisterRekeningSahamCheckEmailPage @CommonFeature @Positive @iOS
	Scenario: [iOS] User chat with customer support from create rekening check email page
		Given User login using "NON_TRADING" account
		And User click portfolio menu
		And User click register button for create saham account
		And User click next button in check valid "phone number" page
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-961 @TESTSET_ATI-957 @Automated @ChatWithCustomerPageFromRegisterInputFullname @ChatWithCustomerSupport @CommonFeature @Positive @iOS
	Scenario: [iOS] User chat with customer support from register input email page
		Given User is on stockbit landingpage
		When User click daftar
		And User click daftar dengan email
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-960 @TESTSET_ATI-957 @Automated @ChatWithCustomerPageFromRegisterWithEmailPage @ChatWithCustomerSupport @CommonFeature @Positive @iOS
	Scenario: [iOS] User chat with customer support from register with email page
		Given User is on stockbit landingpage
		When User click daftar
		And User click daftar dengan email
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-959 @TESTSET_ATI-957 @Automated @ChatWithCustomerSupport @ChatWithCustomerSupportFromRegisterEntryPoint @CommonFeature @Positive @iOS
	Scenario: [iOS] User chat with customer support from register page entry point
		Given User is on stockbit landingpage
		When User click daftar
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-958 @TESTSET_ATI-957 @Automated @ChatWitchCustomerSupportFromLoginPage @ChatWithCustomerSupport @CommonFeature @Positive @iOS
	Scenario: [iOS] User chat with customer support from login page
		Given User is on stockbit landingpage
		When User click login
		And User click customer support button
		Then User see customer support chat page
		
	@TEST_ATI-1011 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @ChatRequest @CommonFeature @Positive @iOS
	Scenario: [iOS] User check chat request
		Given User login using "TRADING" account
		When User click chat menu
		And User login using api "CHAT_REQUEST_USERNAME" and "CHAT_REQUEST_PASSWORD"
		And User send chat to "TRADING_USERNAME" using api
		And User click request chat
		Then User see chat request user
		
	@TEST_ATI-928 @TESTSET_ATI-442 @TESTSET_ATI-2208 @Automated @OnTrading @Positive @Profile @SwitchVirtualTradingToRealTrading @iOS
	Scenario: [iOS] User switch from virtual trading to real trading from order buy page
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click switch to real button in order page
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click portfolio menu
		Then User see trading portfolio page
		
	@TEST_ATI-929 @TESTSET_ATI-442 @TESTSET_ATI-2208 @Automated @Negative @OnTrading @Profile @SwitchVirtualTradingToRealTrading @iOS
	Scenario: [iOS] User switch from virtual trading to real trading in order page (Wrong PIN)
		Given User login using "TRADING" account
		When User click portfolio menu
		And User go to virtual trading
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click switch to real button in order page
		And User input trading pin "WRONG_PIN_TRADING"
		Then User still in insert pin page
		
	@TEST_ATI-1045 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @ChooseGoodTillCancelled @OnTrading @OrderPage @Positive @iOS
	Scenario: [iOS][Real Trading] User choose good till cancelled for expiry settings
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click dropdown expiry setting
		And User see popup expiry setting
		And User choose "Good Till Cancelled" for expiry setting
		Then User see success choose "Good Till Cancelled" for expiry setting
		
	@TEST_ATI-1044 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @ChooseGoodForDay @OnTrading @OrderPage @Positive @iOS
	Scenario: [iOS][Real Trading] User choose good for day for expiry setting
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click dropdown expiry setting
		And User see popup expiry setting
		And User choose "Good For Day" for expiry setting
		Then User see success choose "Good For Day" for expiry setting
		
	@TEST_ATI-1043 @TESTSET_ATI-917 @TESTSET_ATI-2461 @Automated @CancelChooseExpirySetting @OnTrading @OrderPage @Positive @iOS
	Scenario: [iOS][Real Trading] User cancel choose expiry setting
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "GOTO" from watchlist
		And User click dropdown expiry setting
		And User see popup expiry setting
		And User click close in popup expiry setting
		Then User see success close popup expiry setting
		
	@TEST_ATI-1184 @TESTSET_ATI-1183 @Automated @ClickLinkFromUserProfile @CommonFeature @LinkInteraction @Positive @iOS
	Scenario: [iOS] [Deeplink] User click link from user profile
		Given User login using "TRADING" account
		When User edit website link as "https://cutt.ly" using api
		And User click side profile icon
		And User click view profile
		And User click website link "https://cutt.ly" in profile page
		Then User see website "Cuttly" page
		
	@TEST_ATI-1185 @TESTSET_ATI-1183 @Automated @ClickLinkFromGroupChat @CommonFeature @LinkInteraction @Positive @iOS
	Scenario: [iOS] User click link from group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User send chat "https://cutt.ly" to group chat using api
		And User click message from new group chat
		And User see room group chat page
		And User click website link "https://cutt.ly" in "group chat" page
		Then User see website "Cuttly" page
		
	@TEST_ATI-1186 @TESTSET_ATI-1183 @Automated @ClickLinkFromPrivateChat @CommonFeature @LinkInteraction @Positive @iOS
	Scenario: [iOS][Chat] User click link from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User send chat to "NON_TRADING_USERNAME" with chat "https://cutt.ly" using api
		And User click chat with "NON_TRADING_USERNAME" in list chat
		And User click website link "https://cutt.ly" in "chat" page
		Then User see website "Cuttly" page
		
	@TEST_ATI-1009 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatWithNotAddedUser @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with not added user
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		Then User see next button is "disable"
		
	@TEST_ATI-1007 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatWithDescriptionAboveMaxCharacter @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with description above max character
		Given User login using "TRADING" account
		And User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survey" for group chat description
		Then User see create button is "disable"
		
	@TEST_ATI-1008 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatWithGroupNameAndDescriptionAboveMaxCharacter @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with group name and description above max character
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Lorem Ipsum is simply dummy text" for group chat name
		And User input "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survey" for group chat description
		Then User see create button is "disable"
		
	@TEST_ATI-1006 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateChatGroupWithGroupNameAboveMaxCharacter @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with group name above max character
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Lorem Ipsum is simply dummy text" for group chat name
		Then User see create button is "disable"
		
	@TEST_ATI-1000 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatWithBlankGroupNameAndDescription @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with blank group name and description
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		Then User see create button is "disable"
		
	@TEST_ATI-1001 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGriupChatWithBlankGroupName @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with blank group name
		Given User login using "TRADING" account
		And User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Group Saham" for group chat description
		Then User see create button is "disable"
		
	@TEST_ATI-1012 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SearchUserMemberNotFound @iOS
	Scenario: [iOS][Group Chat] User not found on search when create group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "~!@#$%^&*()_+|}|" in search group member
		Then User see not results found in new group chat page
		
	@TEST_ATI-1002 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatWithBlankDescription @GroupChat @Negative @iOS
	Scenario: [iOS][Group Chat] User create group chat with blank description
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Group" for group chat name
		Then User see create button is "enable"
		
	@TEST_ATI-980 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SearchUserGroupChatMember @iOS
	Scenario: [iOS][Group Chat] User search user group chat member
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User see "NON_TRADING_USERNAME" in search result group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		Then User success select "NON_TRADING_USERNAME" as group chat member
		
	@TEST_ATI-985 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SelectAndUnSelectUserGroupMember @iOS
	Scenario: [iOS][Group Chat] User select and un select user group member from search member
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User see "NON_TRADING_USERNAME" in search result group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User success select "NON_TRADING_USERNAME" as group chat member
		And User un select user to group chat member
		Then User see no one selected user to group chat
		
	@TEST_ATI-986 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SelectAndUnSelectUserGroupMember @iOS
	Scenario: [iOS][Group Chat] Select & Unselect user group from suggestion member
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User select "5" user group chat member from suggestion user
		And User see counter user selected is "5"
		And User un select user to group chat member
		Then User see no one selected user to group chat
		
	@TEST_ATI-987 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SelectAndUnSelectUserGroupMember @iOS
	Scenario: [iOS][Group Chat] User select and unselect all suggested users from suggestion member
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User select all user group chat member from suggestion user
		And User see counter all user selected to group chat from suggestion user
		And User un select user to group chat member
		Then User see no one selected user to group chat
		
	@TEST_ATI-994 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @UserCreateGroupChat @iOS
	Scenario: [iOS][Group Chat] User create group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User click new chat message
		And User click create new group chat
		And User see create new group chat page
		And User search user "NON_TRADING_USERNAME" in search group member
		And User select "NON_TRADING_USERNAME" as group member
		And User click clear search box user group chat member
		And User see counter user selected is "1"
		And User click next in new group chat
		And User input "Group" for group chat name
		And User input "Group Saham" for group chat description
		And User click create in new group chat
		And User success create group chat with "2" members
		And User see room group chat page
		And User click back button
		Then User see group chat in list chat page
		
	@TEST_ATI-995 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @UserCancelDeleteGroupChat @iOS
	Scenario: [iOS][Group Chat] User cancel delete group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User cancel delete group chat
		Then User see room group chat page
		
	@TEST_ATI-996 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @UserDeleteGroupChat @iOS
	Scenario: [iOS][Group Chat] User delete the group for all members
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User delete group chat
		Then User success delete group chat
		
	@TEST_ATI-997 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @UserAsRoleAdminCancelLeaveGroupChat @iOS
	Scenario: [iOS][Group Chat] User as role admin cancel leave group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User as role admin leave group
		And User click cancel choose new admin
		And User see room group chat page
		
	@TEST_ATI-998 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @UserAsRoleAdminLeaveGroupChat @iOS
	Scenario: [iOS][Group Chat] User as role admin leave group chat and assign admin to other suer
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User as role admin leave group
		And User click choose new admin
		And User see choose new admin group chat page
		And User select "NON_TRADING_USERNAME" for new admin group chat
		And User click new admin and leave group
		Then User success leave group chat
		
	@TEST_ATI-999 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CreateGroupChatAndSendChat @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User create group chat and send chat text only
		Given User login using "TRADING" account
		When User click chat menu
		And User delete all group chat using api
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User send chat in group chat
		Then User success send chat in group chat
		
	@TEST_ATI-1013 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SendGroupChatEmoji @iOS
	Scenario: [iOS][Group Chat] User create group chat and send chat emoji only
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User send chat emoji only in group chat
		Then User success send chat emoji in group chat
		
	@TEST_ATI-1014 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SendChatTextEmoji @iOS
	Scenario: [iOS][Group Chat] User create group chat and send chat text and emoji
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User send chat text and emoji only in group chat
		Then User success send chat text and emoji in group chat
		
	@TEST_ATI-1017 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @AddMemberInCreatedGroupChat @Automated @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User add new member in created group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click add member in group chat info page
		And User see add member group chat page
		And User search user "TRADING2_USERNAME" in search group member
		And User see "TRADING2_USERNAME" in search result group member
		And User select "TRADING2_USERNAME" as group member
		And User click clear search box user group chat member
		And User success select "TRADING2_USERNAME" as group chat member
		And User click done in add member group chat page
		Then User success add "TRADING2_USERNAME" as member group chat page
		
	@TEST_ATI-1018 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SerachMemberGroupChat @iOS
	Scenario: [iOS][Group Chat] User search group member
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "view profile" in popup member group chat page
		Then User see "NON_TRADING_USERNAME" profile page
		
	@TEST_ATI-1019 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @PersonalChatMemberGroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User personal chat member group chat  from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "chat" in popup member group chat page
		And User input random message
		And User sends chat
		Then Correct message is sent to recipient
		
	@TEST_ATI-1024 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelRemoveMemberGroupChat @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel remove member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "remove member" in popup member group chat page
		And User "see" popup remove member
		And User click "cancel" in popup remove member
		Then User "not see" popup remove member
		
	@TEST_ATI-1025 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @RemoveMemberGroupChat @iOS
	Scenario: [iOS][Group Chat] User remove member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "remove member" in popup member group chat page
		And User "see" popup remove member
		And User click "remove" in popup remove member
		Then User success remove member with name "NON_TRADING_USERNAME"
		
	@TEST_ATI-1195 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitation @LinkInteraction @Positive @iOS
	Scenario: [iOS] Non member click link group invitation and cancel join group from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User login using api "NON_TRADING2_USERNAME" and "NON_TRADING2_PASSWORD"
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using api "TRADING_USERNAME" and "TRADING_PASSWORD"
		And User send chat to "TRADING2_USERNAME" with chat "invitation group chat" using api
		And User click chat with "TRADING2_USERNAME" in list chat
		And User click group chat invitation link in "chat" page
		And User "see" popup group info join group via invitation link
		And User click "cancel" in popup group info join group via invitation link
		Then User "not see" popup group info join group via invitation link
		
	@TEST_ATI-1196 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitation @LinkInteraction @Positive @iOS
	Scenario: [iOS]Non member click link group invitation and join group from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User login using api "NON_TRADING2_USERNAME" and "NON_TRADING2_PASSWORD"
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using api "TRADING_USERNAME" and "TRADING_PASSWORD"
		And User send chat to "TRADING2_USERNAME" with chat "invitation group chat" using api
		And User click chat with "TRADING2_USERNAME" in list chat
		And User click group chat invitation link in "chat" page
		And User "see" popup group info join group via invitation link
		And User click "join" in popup group info join group via invitation link
		Then User see group chat room via invitation link
		
	@TEST_ATI-1197 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationInactivegroup @LinkInteraction @Negative @iOS
	Scenario: [iOS] User click link inactive group invitation from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User login using api "NON_TRADING2_USERNAME" and "NON_TRADING2_PASSWORD"
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User delete all group chat using api
		And User login using api "TRADING_USERNAME" and "TRADING_PASSWORD"
		And User send chat to "TRADING2_USERNAME" with chat "invitation group chat" using api
		And User click chat with "TRADING2_USERNAME" in list chat
		And User click group chat invitation link in "chat" page
		And User "see" popup group not found via invitation link
		And User click "close" in popup group info join group via invitation link
		Then User "not see" popup group not found via invitation link
		
	@TEST_ATI-1198 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitation @LinkGroupInvitationInactivegroup @LinkInteraction @Positive @iOS
	Scenario: [iOS] Non member click inactive link group invitation and cancel join group from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User send chat to "TRADING2_USERNAME" with chat "invitation group chat" using api
		And User click chat with "TRADING2_USERNAME" in list chat
		And User click group chat invitation link in "chat" page
		And User "see" popup group info join group via invitation link
		And User click "cancel" in popup group info join group via invitation link
		Then User "not see" popup group info join group via invitation link
		
	@TEST_ATI-1199 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationSendToPrivateChat @LinkInteraction @Positive @iOS
	Scenario: [iOS] Group member click link group invitation and join group from private chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User send chat to "NON_TRADING_USERNAME" with chat "invitation group chat" using api
		And User click chat with "NON_TRADING_USERNAME" in list chat
		And User click group chat invitation link in "chat" page
		And User "see" popup group info join group via invitation link
		And User click "message" in popup group info join group via invitation link
		Then User see group chat room via invitation link
		
	@TEST_ATI-1200 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationCancelJoinFromGroupChat @LinkInteraction @Positive @iOS
	Scenario: [iOS] Non member click link group invitation and cancel join group from group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using api "NON_TRADING2_USERNAME" and "NON_TRADING2_PASSWORD"
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using api "TRADING_USERNAME" and "TRADING_PASSWORD"
		And User send chat "invitation group chat" to group chat using api
		And User get list of group chat name using api
		And User click message from new group chat
		And User see room group chat page
		And User click group chat invitation link in "group chat" page
		And User "see" popup group info join group via invitation link
		And User click "cancel" in popup group info join group via invitation link
		Then User "not see" popup group info join group via invitation link
		
	@TEST_ATI-1201 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationJoinFromGroupChat @LinkInteraction @Positive @iOS
	Scenario: [iOS] Non member click link group invitation and join group from group chat
		Given User login using "NON_TRADING" account
		When User click chat menu
		And User delete all group chat using api
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using "NON_TRADING2" account via api
		And User delete all group chat using api
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User send chat "invitation group chat" to group chat using api
		And User get list of group chat name using api
		And User click message from new group chat
		And User see room group chat page
		And User click group chat invitation link in "group chat" page
		And User "see" popup group info join group via invitation link
		And User click "join" in popup group info join group via invitation link
		Then User see group chat room via invitation link
		
	@TEST_ATI-1202 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationCancelJoinFromGroupChat @LinkInteraction @Positive @iOS
	Scenario: [iOS] Group member click link group invitation and cancel join group from group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User send chat "invitation group chat" to group chat using api
		And User click message from new group chat
		And User see room group chat page
		And User click group chat invitation link in "group chat" page
		And User "see" popup group info join group via invitation link
		And User click "cancel" in popup group info join group via invitation link
		Then User "not see" popup group info join group via invitation link
		
	@TEST_ATI-1203 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitatationJoinFromGroupChat @LinkInteraction @Positive @iOS
	Scenario: [iOS] Group member click link group invitation and join group from group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User send chat "invitation group chat" to group chat using api
		And User click message from new group chat
		And User see room group chat page
		And User click group chat invitation link in "group chat" page
		And User "see" popup group info join group via invitation link
		And User click "message" in popup group info join group via invitation link
		Then User see group chat room via invitation link
		
	@TEST_ATI-1204 @TESTSET_ATI-1183 @Automated @CommonFeature @LinkGroupInvitationInactivegroup @LinkInteraction @Negative @iOS
	Scenario: [iOS][Group Chat] User click link inactive group invitation from group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User login using api "NON_TRADING2_USERNAME" and "NON_TRADING2_PASSWORD"
		And User create group chat with "TRADING2_USERNAME" as member using api
		And User delete all group chat using api
		And User login using api "TRADING_USERNAME" and "TRADING_PASSWORD"
		And User send chat "invitation group chat" to group chat using api
		And User get list of group chat name using api
		And User click message from new group chat
		And User see room group chat page
		And User click group chat invitation link in "group chat" page
		And User "see" popup group not found via invitation link
		And User click "close" in popup group info join group via invitation link
		Then User "not see" popup group not found via invitation link
		
	@TEST_ATI-1205 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserClickSymbolInTabGlobal @iOS
	Scenario: [iOS] User click symbol by tab global in search page
		Given User login using "TRADING" account
		When User click search menu
		Then User see tabs in search page
		And User click "GLOBAL" tab in search page
		Then User see "GLOBAL" section in search page
		And User click one of symbol in "GLOBAL" tab section in search page
		Then User see "SYMBOL" company page
		
	@TEST_ATI-1206 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @UserClickSymbolInTabReksaDana @iOS
	Scenario: [iOS] User click symbol by tab reksadana in search page
		Given User login using "TRADING" account
		When User click search menu
		Then User see tabs in search page
		And User click "REKSADANA" tab in search page
		Then User see "REKSADANA" section in search page
		And User click one of symbol in "REKSADANA" tab section in search page
		Then User see "SYMBOL" company page
		
	@TEST_ATI-1015 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CopyLinkInvitationGroupChat @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User copy link invitation group chat from link text displayed
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User click link text displayed in popup invite via link in group chat info page
		Then User success copy link invite via link in group chat info page
		
	@TEST_ATI-1016 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @CopyLinkInvitationGroupChat @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User create group chat and copy link invitation group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User see group chat in list chat page
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User click "copy link" in popup invite via link in group chat info page
		Then User success copy link invite via link in group chat info page
		
	@TEST_ATI-1020 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelAssignAdminToMemberGroupChat @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel assign admin to member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "cancel" in popup assign admin group chat page
		Then User "not see" popup assign admin
		
	@TEST_ATI-1021 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @AssignAdminToMemberGroupChat @Automated @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User assign admin to member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User success "assign" admin to user
		
	@TEST_ATI-1022 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelRemoveAssignAdmin @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel remove assign admin to member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User success "assign" admin to user
		And User click back button
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "remove admin" in popup member group chat page
		And User "see" popup remove assign admin
		And User click "cancel" in popup remove assign admin group chat page
		Then User "not see" popup remove assign admin
		
	@TEST_ATI-1023 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @RemoveAssignAdmin @iOS
	Scenario: [iOS][Group Chat] User remove assign admin to member group chat from search member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User click back button
		And User success "assign" admin to user
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User see popup user member action
		And User click "remove admin" in popup member group chat page
		And User "see" popup remove assign admin
		And User click "remove" in popup remove assign admin group chat page
		Then User success "remove" admin to user
		
	@TEST_ATI-1026 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @PersonalChatMemberGroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User personal chat member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "chat" in popup member group chat page
		And User input random message
		And User sends chat
		Then Correct message is sent to recipient
		
	@TEST_ATI-1027 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelAssignAdminToMemberGroupChat @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel assign admin to member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "cancel" in popup assign admin group chat page
		Then User "not see" popup assign admin
		
	@TEST_ATI-1029 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @AssignAdminToMemberGroupChat @Automated @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User assign admin to member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User success "assign" admin to user
		
	@TEST_ATI-1030 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelRemoveAssignAdmin @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel remove assign admin to member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User success "assign" admin to user
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "remove admin" in popup member group chat page
		And User "see" popup remove assign admin
		And User click "cancel" in popup remove assign admin group chat page
		Then User "not see" popup remove assign admin
		
	@TEST_ATI-1031 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @RemoveAssignAdmin @iOS
	Scenario: [iOS][Group Chat] User remove assign admin to member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User login using "NON_TRADING" account via api
		And User accept room invitation using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "assign admin" in popup member group chat page
		And User "see" popup assign admin
		And User click "confirm" in popup assign admin group chat page
		And User success "assign" admin to user
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "remove admin" in popup member group chat page
		And User "see" popup remove assign admin
		And User click "remove" in popup remove assign admin group chat page
		Then User success "remove" admin to user
		
	@TEST_ATI-1032 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelRemoveMemberGroupChat @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel remove member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "remove member" in popup member group chat page
		And User "see" popup remove member
		And User click "cancel" in popup remove member
		Then User "not see" popup remove member
		
	@TEST_ATI-1033 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @RemoveMemberGroupChat @iOS
	Scenario: [iOS][Group Chat] User remove member group chat from list member page
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click "NON_TRADING_USERNAME" in list member page
		And User see popup user member action
		And User click "remove member" in popup member group chat page
		And User "see" popup remove member
		And User click "remove" in popup remove member
		Then User success remove member with name "NON_TRADING_USERNAME"
		
	@TEST_ATI-1036 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @AddGroupChatAfterCreateGroupChat @Automated @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User add description after create group
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member without description using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click add description in group chat info page
		And User see edit group chat page
		And User edit description group chat
		And User click save in edit group chat page
		Then User success edit description group chat
		
	@TEST_ATI-1037 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SendLinkGroupChatViaStockbit @iOS
	Scenario: [iOS][Group Chat] User send link via stockbit chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User click "send link" in popup invite via link in group chat info page
		And User send link group chat to "TRADING2_USERNAME"
		And User click back button 2 times
		Then User success send invitation to group chat
		
	@TEST_ATI-1207 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @ShareLinkGroupChat @iOS
	Scenario: [iOS][Group Chat] User share copy link group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User click "share link" in popup invite via link in group chat info page
		And User "see" popup share link group chat
		And User click copy in popup share link group chat
		Then User success copy link group chat
		
	@TEST_ATI-1208 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CancelResetLinkGroupChat @CommonFeature @GroupChat @Positive @iOS
	Scenario: [iOS][Group Chat] User cancel reset link group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User click "reset link" in popup invite via link in group chat info page
		And User "see" popup reset link group chat
		And User click "cancel" button in popup reset link group chat
		Then User "not see" popup reset link group chat
		
	@TEST_ATI-1209 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @ResetLinkGroupChat @iOS
	Scenario: [iOS][Group Chat] User reset link group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click invite via link in group chat info page
		And User see popup invite via link in group chat info page
		And User get link invitation "before" reset
		And User click "reset link" in popup invite via link in group chat info page
		And User "see" popup reset link group chat
		And User click "reset link" button in popup reset link group chat
		And User get link invitation "after" reset
		Then User see success reset link group chat
		
	@TEST_ATI-1210 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SetNotificationGroupChat @iOS
	Scenario: [iOS][Group Chat] User set notifications group chat
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click three dot in room group chat
		And User click "mute" notifications in group chat
		And User click back button
		And User click message from new group chat
		And User click three dot in room group chat
		And User success set "mute" notifications
		And User click "unmute" notifications in group chat
		And User click back button
		And User click message from new group chat
		And User click three dot in room group chat
		Then User success set "unmute" notifications
		
	@TEST_ATI-1211 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Negative @SearchNewMemberNotFound @iOS
	Scenario: [iOS][Group Chat] User search member group chat not found
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click add member in group chat info page
		And User see add member group chat page
		And User search user "~!@#$%^&*()" in search group member
		Then User see "Tidak ada hasil yang ditemukan" in search member group chat
		
	@TEST_ATI-1272 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SharePortfolio @iOS
	Scenario: [iOS] User share portfolio
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click share via "BASIC SHARE" in popup portfolio share
		Then User success share portfolio via "BASIC SHARE"
		
	@TEST_ATI-1273 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SharePortfolio @SharePortfolioViaInstagram @iOS
	Scenario: [iOS] User share portfolio via instagram story
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click share via "IG STORY" in popup portfolio share
		Then User success share portfolio via "IG STORY"
		
	@TEST_ATI-1274 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SharePortfolio @SharePortfolioViaInstagram @iOS
	Scenario: [iOS] User share portfolio via instagram post
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click share via "IG POST" in popup portfolio share
		Then User success share portfolio via "IG POST"
		
	@TEST_ATI-1275 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SharePortfolio @SharePortfolioViaFb @iOS
	Scenario: [iOS] User share portfolio via facebook post
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click share via "FACEBOOK" in popup portfolio share
		Then User success share portfolio via "FACEBOOK"
		
	@TEST_ATI-1276 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SavePortfolio @SharePortfolio @iOS
	Scenario: [iOS] User save portfolio
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click save in popup portfolio share
		Then User success save portfolio
		
	@TEST_ATI-1277 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SharePortfolio @SharePortfolioViaStockbitChat @iOS
	Scenario: [iOS] User share detail portfolio via stockbit chat
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click share portfolio tooltips
		And User see popup share portfolio
		And User hide popup portfolio share
		And User click share portfolio button
		And User click share via "CHAT" in popup portfolio share
		And User share portfolio via chat to "NON_TRADING_USERNAME"
		Then User success share portfolio via "CHAT"
		
	@TEST_ATI-1279 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @ShareDetailPortfolio @iOS
	Scenario: [iOS] User share detail portfolio
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click share detail portfolio button
		And User click share via "BASIC SHARE" in popup portfolio share
		Then User success share portfolio via "BASIC SHARE"
		
	@TEST_ATI-1280 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @ShareDetailPortfolio @ShareDetailPortfolioViaInstagram @iOS
	Scenario: [iOS] User share detail portfolio via instagram story
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click share detail portfolio button
		And User click share via "IG STORY" in popup portfolio share
		Then User success share portfolio via "IG STORY"
		
	@TEST_ATI-1281 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @ShareDetailPortfolio @ShareDetailPortfolioViaInstagram @iOS
	Scenario: [iOS] User share detail portfolio via instagram post
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click share detail portfolio button
		And User click share via "IG POST" in popup portfolio share
		Then User success share portfolio via "IG POST"
		
	@TEST_ATI-1282 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @ShareDetailPortfolio @ShareDetailPortfolioViaFacebook @iOS
	Scenario: [iOS] User share detail portfolio via facebook post
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click share detail portfolio button
		And User click share via "FACEBOOK" in popup portfolio share
		Then User success share portfolio via "FACEBOOK"
		
	@TEST_ATI-1283 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @SaveDetailPortfolio @ShareDetailPortfolio @iOS
	Scenario: [iOS] User save detail portfolio
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click share detail portfolio button
		And User click save in popup portfolio share
		Then User success save detail portfolio
		
	@TEST_ATI-1289 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @TransferSaham @TransferSahamWitIncompleteData @iOS
	Scenario: [iOS] User do stock transfer with incomplete data from top securities list (step 2)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User get top securities for stock transfer submission field using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User click stock transfer entry point
		And User choose securities for stock transfer
		And User input all field submission request stock transfer
		And User click next button in stock transfer page
		And User input stock symbol "BBRI"
		And User input number of sheets "3"
		And User input purchase price "4"
		And User click save button in stock transfer page
		And User click checkbox tnc stock transfer
		And User click next button in stock transfer page
		And User click checkbox in popup confirmation data
		And User click next button in popup confirmation data
		And User click back button from stock transfer "4" times
		Then User see stock transfer with incomplete data step "2"
		
	@TEST_ATI-1340 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @HistoryTransaction @OnTrading @Portfolio @Positive @SearchHistoryTransactionAllTime @iOS
	Scenario: [iOS] User search history transaction with period all time
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User click entry point period list
		And User choose "ALL TIME" history period list
		And User search "GOTO" in history transaction
		Then User see "GOTO" in history transaction list
		
	#TRANSFER SAHAM
	@TEST_ATI-1288 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @TransferSaham @TransferSahamWitIncompleteData @iOS
	Scenario: [iOS] User do stock transfer with incomplete data from top securities list (step 1)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User get top securities for stock transfer submission field using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User click stock transfer entry point
		And User choose securities for stock transfer
		And User input all field submission request stock transfer
		And User click next button in stock transfer page
		And User click back button from stock transfer "3" times
		Then User see stock transfer with incomplete data step "1"
		
	@TEST_ATI-1290 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @TransferSaham @TransferSahamWitIncompleteData @iOS
	Scenario: [iOS] User do stock transfer with incomplete data from top securities list (step 3)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User get top securities for stock transfer submission field using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User click stock transfer entry point
		And User choose securities for stock transfer
		And User input all field submission request stock transfer
		And User click next button in stock transfer page
		And User input stock symbol "BBRI"
		And User input number of sheets "3"
		And User input purchase price "4"
		And User click save button in stock transfer page
		And User click checkbox tnc stock transfer
		And User click next button in stock transfer page
		And User see popup data stock transfer confirmation
		And User click checkbox in popup confirmation data
		And User click next button in popup confirmation data
		And User see step check email stock transfer
		And User click next button in stock transfer page
		And User see step print and upload stock transfer
		And User click back button from stock transfer "5" times
		Then User see stock transfer with incomplete data step "3"
		
	@TEST_ATI-1360 @TESTSET_ATI-310 @TESTSET_ATI-2131 @Automated @CommonFeature @Negative @Register @UserRegisterWithInvalidOtp @iOS
	Scenario: [iOS] User Register with input invalid otp
		Given User is on stockbit landingpage
		When User click daftar
		And User click daftar dengan email
		And User input email address "EMAIL"
		And User click selanjutnya
		And User see input otp page
		And User input otp "1111"
		Then User still in otp page
		
	@TEST_ATI-1323 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyFromWatchlist @OnTrading @Positive @RealBuy @iOS
	Scenario: [iOS][Real Trading] User buy from watchlist
		Given User login using "TRADING3" account
		When User real buy "TRADING_STOCK_SYMBOL" from watchlist
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User set real order lot buy "1"
		And User click buy button in real buy order page
		And User see popup preview buy order
		And User click "CONFIRM" button in popup preview order
		And User see popup success buy order
		And User click done in popup success order
		And User click portfolio menu
		And User click "ORDER" tab in portfolio page
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-1324 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyFromWatchlistGoodTillCancelled @OnTrading @Positive @RealBuy @iOS
	Scenario: [iOS][Real Trading] User buy from watchlist (Good Till Cancelled)
		Given User login using "TRADING3" account
		When User real buy "TRADING_STOCK_SYMBOL" from watchlist
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User set real order lot buy "1"
		And User click dropdown expiry setting
		And User see popup expiry setting
		And User choose "Good Till Cancelled" for expiry setting
		And User see success choose "Good Till Cancelled" for expiry setting
		And User click buy button in real buy order page
		And User see popup preview buy order
		And User click "CONFIRM" button in popup preview order
		And User click done in popup success order
		And User click portfolio menu
		And User click "ORDER" tab in portfolio page
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-1325 @TESTSET_ATI-306 @TESTSET_ATI-2461 @AmendBuyOrder @Automated @OnTrading @Positive @RealBuy @iOS
	Scenario: [iOS][Real Trading] User amend buy order
		Given User login using "TRADING3" account
		When User login to securities with pin "PIN_TRADING3" using api
		And User create order "BUY" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User click newest order list
		And User click "AMEND" button in order detail
		And User set price amend "BUY"
		And User click amend button in order "BUY" page
		And User see popup preview amend order
		And User click "CONFIRM" button in popup preview order
		And User see popup success amend "BUY" order
		And User click done button in success amend "BUY" order
		Then User see status order "OPEN|AMENDED"
		
	@TEST_ATI-1326 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @CancelOrderBuy @OnTrading @Positive @RealBuy @iOS
	Scenario: [iOS][Real Trading] User cancel order buy
		Given User login using "TRADING3" account
		When User login to securities with pin "PIN_TRADING3" using api
		And User create order "BUY" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User click newest order list
		And User click "CANCEL ORDER" button in order detail
		And User click cancel in popup confirmation cancel order
		And User click newest order list
		Then User see status order "WITHDRAWN"
		
	@TEST_ATI-1327 @TESTSET_ATI-1384 @TESTSET_ATI-2461 @Automated @OnTrading @OrderSell @Positive @RealSell @iOS
	Scenario: [iOS][Real Trading] User order sell from portfolio list
		Given User login using "TRADING3" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "TRADING_STOCK_SYMBOL" in portfolio list
		And User click sell button in portfolio detail page
		And User set real order lot sell "1"
		And User click sell button in real sel order page
		And User see popup preview sell order
		And User click "CONFIRM" button in popup preview order
		And User see popup success sell order
		And User click done in popup success order
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-1328 @TESTSET_ATI-1384 @TESTSET_ATI-2461 @Automated @OnTrading @OrderSellGoodTillCancelled @Positive @RealSell @iOS
	Scenario: [iOS][Real Trading] User order sell from portfolio list (Good Till Cancelled)
		Given User login using "TRADING3" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "TRADING_STOCK_SYMBOL" in portfolio list
		And User click sell button in portfolio detail page
		And User set real order lot sell "1"
		And User click dropdown expiry setting in order sell
		And User see popup expiry setting
		And User choose "Good Till Cancelled" for expiry setting
		And User see success choose "Good Till Cancelled" for expiry setting
		And User click sell button in real sel order page
		And User see popup preview sell order
		And User click "CONFIRM" button in popup preview order
		And User see popup success sell order
		And User click done in popup success order
		Then User see status order "OPEN|MATCH"
		
	@TEST_ATI-1329 @TESTSET_ATI-1384 @TESTSET_ATI-2461 @AmendOrderSell @Automated @OnTrading @Positive @RealSell @iOS
	Scenario: [iOS][Real Trading] User amend order sell
		Given User login using "TRADING3" account
		When User login to securities with pin "PIN_TRADING3" using api
		And User create order "BUY MATCH" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User create order "SELL" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User click newest order list
		And User click "AMEND" button in order detail
		And User set price amend "SELL"
		And User click amend button in order "SELL" page
		And User see popup preview amend order
		And User click "CONFIRM" button in popup preview order
		And User see popup success amend "SELL" order
		And User click done button in success amend "SELL" order
		Then User see status order "OPEN|AMENDED"
		
	@TEST_ATI-1330 @TESTSET_ATI-1384 @TESTSET_ATI-2461 @Automated @CancelOrderSell @OnTrading @Positive @RealSell @iOS
	Scenario: [iOS][Real Trading] User cancel order sell
		Given User login using "TRADING3" account
		When User login to securities with pin "PIN_TRADING3" using api
		And User create order "BUY MATCH" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User create order "SELL" symbol "TRADING_STOCK_SYMBOL" with open status using api
		And User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User click newest order list
		And User click "CANCEL ORDER" button in order detail
		And User click cancel in popup confirmation cancel order
		And User click newest order list
		Then User see status order "WITHDRAWN"
		
	@TEST_ATI-1436 @TESTSET_ATI-1434 @Automated @CommonFeature @DownloadUnboxingSaham @Positive @UnboxingSaham @iOS
	Scenario: [iOS] [Unboxing] User download unboxing saham
		Given User login using "TRADING" account
		When User click search menu
		And User click see more in unboxing saham section
		And User see unboxing saham page
		And User click tab "ALL" in unboxing saham section
		And User click one of list unboxing saham in "ALL" tab
		And User see detail unboxing saham
		And User click "DOWNLOAD" in detail unboxing saham
		Then User see popup activity list download unboxing saham
		
	@TEST_ATI-1437 @TESTSET_ATI-1434 @Automated @CommonFeature @Positive @ShareUnboxingSahamViaChat @UnboxingSaham @iOS
	Scenario: [iOS] User share unboxing saham via chat
		Given User login using "TRADING" account
		When User click search menu
		And User click see more in unboxing saham section
		And User see unboxing saham page
		And User click tab "ALL" in unboxing saham section
		And User click one of list unboxing saham in "ALL" tab
		And User see detail unboxing saham
		And User click "SHARE" in detail unboxing saham
		And User send unboxing saham to "NON_TRADING_USERNAME" via chat
		Then User success send unboxing saham via chat
		
	@TEST_ATI-1438 @TESTSET_ATI-1434 @Automated @CommonFeature @CopyLinkUnboxingSaham @Positive @UnboxingSaham @iOS
	Scenario: [iOS] User copy link unboxing saham
		Given User login using "TRADING" account
		When User click search menu
		And User click see more in unboxing saham section
		And User see unboxing saham page
		And User click tab "ALL" in unboxing saham section
		And User click one of list unboxing saham in "ALL" tab
		And User see detail unboxing saham
		And User click "SHARE" in detail unboxing saham
		And User click "COPY LINK" in popup share unboxing saham
		Then User success copy link unboxing saham
		
	@TEST_ATI-1439 @TESTSET_ATI-1434 @Automated @CommonFeature @Positive @RepostUnboxingSaham @UnboxingSaham @iOS
	Scenario: [iOS] User repost unboxing saham
		Given User login using "TRADING" account
		When User click search menu
		And User click see more in unboxing saham section
		And User see unboxing saham page
		And User click tab "ALL" in unboxing saham section
		And User click one of list unboxing saham in "ALL" tab
		And User see detail unboxing saham
		And User click "SHARE" in detail unboxing saham
		And User click "REPOST" in popup share unboxing saham
		And User click post in compose page
		Then User success repost unboxing saham
		
	@TEST_ATI-1421 @TESTSET_ATI-1420 @Automated @OnTrading @Positive @RunningTrade @SeeRunningTradeBySymbol @iOS
	Scenario: [iOS] User see running trade by stock symbol
		Given User login using "TRADING" account
		When User click search menu
		And User click running trade entry point
		And User filter running trade to "BBCA"
		Then User success filtered running trade
		
	@TEST_ATI-1432 @TESTSET_ATI-1420 @Automated @ChangeRunningTradeFilter @OnTrading @Positive @RunningTrade @iOS
	Scenario: [iOS] User change running trade filter
		Given User login using "TRADING" account
		When User click search menu
		And User click running trade entry point
		And User filter running trade to "BBCA"
		And User success filtered running trade
		And User change filter running trade to "BBNI"
		Then User success change filter running trade
		
	@TEST_ATI-1433 @TESTSET_ATI-1420 @Automated @CancelFilterRunningTrade @OnTrading @Positive @RunningTrade @iOS
	Scenario: [iOS] User cancel filter running trade
		Given User login using "TRADING" account
		When User click search menu
		And User click running trade entry point
		And User filter running trade to "BBCA"
		And User success filtered running trade
		And User cancel filter running trade
		And User click back button
		Then User see default filter running trade
		
	@TEST_ATI-1441 @TESTSET_ATI-508 @Automated @OnTrading @Positive @SeeTradingProfile @TradingProfile @iOS
	Scenario: [iOS] User see trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		Then User see detail trading profile
		
	@TEST_ATI-1443 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @Positive @UserGoToPortfolioPageFromPortfolioOrderEmptyState @iOS
	Scenario: [iOS] User go to portfolio page from portfolio order empty state
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "ORDER" tab in portfolio page
		And User see empty state in "ORDER" tab section
		And User click "OPEN PORTFOLIO" in "ORDER" tab section
		Then User see "PORTFOLIO" page from portfolio page
		
	@TEST_ATI-1444 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @GoToWatchlistPageFromPortfolio @OnTrading @Portfolio @Positive @iOS
	Scenario: [iOS] User go to watchlist page from portfolio
		Given User login using "TRADING_ES" account
		When User click portfolio menu
		And User input trading pin "TRADING_ES_PIN"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User see empty state in "HISTORY" tab section
		And User click "DISCOVER NOW" in "HISTORY" tab section
		Then User see "WATCHLIST" page from portfolio page
		
	@TEST_ATI-1450 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @PortfolioHistory @Positive @SearchHistoryTransactionWithAllPeriodDirect @iOS
	Scenario: [iOS] User search history transaction with period all time direct
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User click entry point period list
		And User choose "ALL TIME" history period list
		And User search "BUKA" in history transaction direct
		Then User see "BUKA" in history transaction list
		
	@TEST_ATI-1451 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @ClearSearchBoxHistoryTransaction @OnTrading @Portfolio @PortfolioHistory @Positive @iOS
	Scenario: [iOS] User clear search box in history transaction
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User search "BUKA" in history transaction
		And User clear search box in history transaction
		Then User see search box in history transaction is cleared
		
	@TEST_ATI-1452 @TESTSET_ATI-425 @TESTSET_ATI-2462 @Automated @OnTrading @Portfolio @PortfolioHistory @Positive @SearchHistoryTransactionNotFound @iOS
	Scenario: [iOS] User search history transaction not found
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "HISTORY" tab in portfolio page
		And User search "XXXXXXXXX" in history transaction
		Then User see empty state history transaction
		
	@TEST_ATI-1454 @TESTSET_ATI-1453 @TESTSET_ATI-2462 @Automated @Deposit @DepositHistory @OnTrading @Positive @iOS
	Scenario: [iOS] User see detail deposit history trading account
		Given User login using "TRADING_TRX" account
		When User login to securities with pin "TRADING_TRX_PIN" using api
		And User get deposit history with filter "all" using api
		And User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "HISTORY" in account setting
		And User see history page
		And User click "DEPOSIT" tab in history trading account
		And User click one of list history "DEPOSIT" trading account
		Then User see data "DEPOSIT" history
		
	@TEST_ATI-1455 @TESTSET_ATI-1453 @TESTSET_ATI-2462 @Automated @Deposit @DepositHistory @OnTrading @Positive @iOS
	Scenario: [iOS] User see detail withdrawal history trading account
		Given User login using "TRADING_TRX" account
		When User login to securities with pin "TRADING_TRX_PIN" using api
		And User get withdrawal history with filter "all" using api
		And User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "HISTORY" in account setting
		And User see history page
		And User click "WITHDRAWAL" tab in history trading account
		And User see withdrawal info "Dana kamu akan ditransfer maksimal dalam 2 hari kerja."
		And User click one of list history "WITHDRAWAL" trading account
		Then User see data "WITHDRAWAL" history
		
	@TEST_ATI-1470 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @CancelTransferSahamWithIncompleteData @OnTrading @Positive @TransferSaham @iOS
	Scenario: [iOS] User cancel stock transfer with incomplete data (step 3)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User create stock transfer "STEP 3" using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User see stock transfer with incomplete data step "3"
		And User click "BATALKAN PENGAJUAN" button in detail stock transfer
		And User click "SAYA YAKIN" button in popup confirmation cancel submission stock transfer
		Then User success cancel stock transfer
		
	@TEST_ATI-1469 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @TransferSaham @TransferSahamSeeTooltipsShareTransferCost @iOS
	Scenario: [iOS] User see tooltips share transfer cost stock transfer
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User get top securities for stock transfer submission field using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User click stock transfer entry point
		And User choose securities for stock transfer
		And User input all field submission request stock transfer
		And User click next button in stock transfer page
		And User input stock symbol "BBRI"
		And User input number of sheets "3"
		And User input purchase price "4"
		And User click save button in stock transfer page
		And User click checkbox tnc stock transfer
		And User click next button in stock transfer page
		And User see popup data stock transfer confirmation
		And User click tooltips share transfer cost
		Then User see popup share transfer cost
		
	@TEST_ATI-1468 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @OnTrading @Positive @TransferSaham @TransferSahamSeeStatementAndTerm @iOS
	Scenario: [iOS] User see statement and term in set symbol stock transfer
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User get top securities for stock transfer submission field using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User click stock transfer entry point
		And User choose securities for stock transfer
		And User input all field submission request stock transfer
		And User click next button in stock transfer page
		And User input stock symbol "BBRI"
		And User input number of sheets "3"
		And User input purchase price "4"
		And User click save button in stock transfer page
		And User click statement and term in set symbol stock transfer
		Then User see statement and term in set symbol stock transfer
		
	@TEST_ATI-1467 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @CancelTransferSahamWithIncompleteData @OnTrading @Positive @TransferSaham @iOS
	Scenario: [iOS] User cancel stock transfer with incomplete data (step 4)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User create stock transfer "STEP 4" using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User see stock transfer with incomplete data step "4"
		And User click "BATALKAN PENGAJUAN" button in detail stock transfer
		And User click "SAYA YAKIN" button in popup confirmation cancel submission stock transfer
		Then User success cancel stock transfer
		
	@TEST_ATI-1466 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @CancelTransferSahamWithIncompleteData @OnTrading @Positive @TransferSaham @iOS
	Scenario: [iOS] User cancel stock transfer with incomplete data (step 2)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User create stock transfer "STEP 2" using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User see stock transfer with incomplete data step "2"
		And User click "BATALKAN PENGAJUAN" button in detail stock transfer
		And User click "SAYA YAKIN" button in popup confirmation cancel submission stock transfer
		Then User success cancel stock transfer
		
	@TEST_ATI-1465 @TESTSET_ATI-1287 @TESTSET_ATI-2462 @Automated @CancelTransferSahamWithIncompleteData @OnTrading @Positive @TransferSaham @iOS
	Scenario: [iOS] User cancel stock transfer with incomplete data (step 1)
		Given User login using "TRADING_TRX" account
		When User click portfolio menu
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User cancel all stock transfer using api
		And User create stock transfer "STEP 1" using api
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Stock Transfer" in setting list menu
		And User see stock transfer page
		And User see stock transfer with incomplete data step "1"
		And User click "BATALKAN PENGAJUAN" button in detail stock transfer
		And User click "SAYA YAKIN" button in popup confirmation cancel submission stock transfer
		Then User success cancel stock transfer
		
	@TEST_ATI-1472 @TESTSET_ATI-508 @AccountSettingPage @Automated @CommonFeature @OpenStockbitSocialMediaFromAccountSettingPage @Positive @iOS
	Scenario Outline: [iOS] User open stockbit social media from account setting page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click stockbit "<social media>" in account setting page
		Then User see stockbit "<social media>" page
		
			Examples:
				| social media |
				| TWITTER      |
				| INSTAGRAM    |
				| TIKTOK       |
		
	@TEST_ATI-1491 @TESTSET_ATI-1434 @Automated @CommonFeature @Positive @SeeThreeNewestUnboxingSahamInSearchPage @UnboxingSaham @iOS
	Scenario: [iOS] User see three newest unboxing saham in search page
		Given User login using "TRADING" account
		When User click search menu
		And User go to unboxing saham section in search page
		Then User see three newest unboxing saham in search page
		
	@TEST_ATI-1508 @TESTSET_ATI-545 @TESTSET_ATI-2462 @Automated @BookingEIPO @OnTrading @Positive @e-IPO @iOS
	Scenario: [iOS] User booking e-IPO
		Given User login using "TRADING_TRX" account
		When User click side profile icon
		And User click "e-IPO" in setting list menu
		And User see "e-IPO" setting page
		And User click pelajari lebih lanjut button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click selanjutnya button in e-IPO page
		And User click lihat saham button e-IPO page
		And User see list saham e-IPO
		And User click "Ongoing" tab in e-IPO page
		And User see list saham e-IPO state "Ongoing"
		And User click one of list symbol "Ongoing" in e-IPO list
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click booking on detail e-IPO
		And User click start bidding e-IPO
		And User input lot bidding e-IPO "10"
		And User verify estimated costs on "INPUT" bidding e-IPO page
		And User click review bidding e-IPO
		Then User verify estimated costs on "REVIEW" bidding e-IPO page
		
	@TEST_ATI-1219 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @Automated @OnTrading @OrderType @Positive @SeeTooltipOrderType @iOS
	Scenario: [iOS][Auto Buy] User see tooltips in popup order type
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User click tooltips in order type popup order page
		And User click "Limit Order" in tooltips popup order page
		Then User see "Limit Order" detail tooltips popup order page
		And User click "Auto Buy" in tooltips popup order page
		Then User see "Auto Buy" detail tooltips popup order page
		
	@TEST_ATI-1220 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @Automated @OnTrading @OrderType @Positive @RealBuy @SeeDefaultOrderType @iOS
	Scenario: [iOS][Auto Buy] User see default order type
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		Then User see default order type "Limit Order" in order page
		
	@TEST_ATI-1221 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @ChangeOrderTypeToAutoBuy @OnTrading @OrderType @Positive @RealBuy @iOS
	Scenario: [iOS][Auto Buy] User change order type to auto buy
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User see next button is "disabled" in term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User see next button is "enable" in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		
	@TEST_ATI-1222 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetPriceBellow200 @iOS
	Scenario: [iOS][Auto Buy] Set price auto buy with initial price below 200
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		Then User set price "AUTO BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 1       | 5          | 0           | 6     |
			| 199     | 5          | 7           | 197   |
		
	@TEST_ATI-1223 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetPriceBeween200And500 @iOS
	Scenario: [iOS][Auto Buy] Set price auto buy with initial price between 200 and 500
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		Then User set price "AUTO BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 200     | 5          | 0           | 210   |
			| 203     | 5          | 4           | 205   |
		
	@TEST_ATI-1224 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetPriceBetween500And2000 @iOS
	Scenario: [iOS][Auto Buy] Set price auto buy with initial price between 500 and 2000
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		Then User set price "AUTO BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 500     | 5          | 0           | 525   |
			| 507     | 5          | 4           | 512   |
		
	@TEST_ATI-1225 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetPriceBetween2000And5000 @iOS
	Scenario: [iOS][Auto Buy] Set price auto buy with initial price between 2000 and 5000
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		Then User set price "AUTO BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 2000    | 5          | 0           | 2050  |
			| 2008    | 5          | 4           | 2018  |
		
	@TEST_ATI-1226 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetPriceAbove5000 @iOS
	Scenario: [iOS][Auto Buy] Set price auto buy with initial price above 5000
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		Then User set price "AUTO BUY" and validate the final price
			| initial | amountPlus | amountMinus | final |
			| 5000    | 5          | 0           | 5125  |
			| 5020    | 5          | 4           | 5045  |
		
	@TEST_ATI-1227 @TESTSET_ATI-1430 @TESTSET_ATI-2133 @TESTSET_ATI-2461 @AutoBuyCommonOrder @Automated @CommonOrderBuy @OnTrading @Positive @SetLotAutoBuy @iOS
	Scenario: [iOS][Auto Buy] Set lot auto buy
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to ">="
		And User set auto buy trigger price to "10"
		And User set auto buy price to "10"
		And User set auto buy lot to "1"
		And User click add "5" order lot auto buy
		And User click subtract "1" order lot auto buy
		Then User see final lot auto buy will be "5"
		
	@TEST_ATI-1228 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @CancelChooseExpirySetting @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Buy] User cancel choose expiry setting
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User click dropdown expiry setting auto buy
		And User see popup expiry setting auto buy
		And User click close in popup expiry setting auto buy
		Then User see success close popup expiry setting auto buy
		
	@TEST_ATI-1229 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @ChooseGoodForDay @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Buy] User choose good for day for expiry setting
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User click dropdown expiry setting auto buy
		And User see popup expiry setting auto buy
		And User choose "Good For Day" for expiry setting auto buy
		Then User see success choose "Good For Day" for expiry setting auto buy
		
	@TEST_ATI-1230 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @ChooseGoodTillCancelled @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Buy] User choose good till cancelled for expiry settings
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User click dropdown expiry setting auto buy
		And User see popup expiry setting auto buy
		And User choose "Good Till Cancelled" for expiry setting auto buy
		Then User see success choose "Good Till Cancelled" for expiry setting auto buy
		
	@TEST_ATI-1232 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @OnTrading @Positive @RealBuy @SeeTnCAutoBuyOneTime @iOS
	Scenario: [iOS][Auto Buy] User see tnc auto buy one time
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Limit Order" in popup order type order page
		Then User see success choose "Limit Order" in order page
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		Then User see success choose "Auto Buy" in order page
		
	@TEST_ATI-1233 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @CancelChangeTypeOrder @OnTrading @RealBuy @iOS
	Scenario: [iOS][Auto Buy] User cancel change order type
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User click close button in popup order type
		Then User not see order type popup in order page
		
	@TEST_ATI-1234 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @CancelAutoBuy @OnTrading @RealBuy @iOS
	Scenario: [iOS][Auto Buy] User cancel set auto buy
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		Then User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to "<="
		And User set auto buy trigger price to "1"
		And User set auto buy price to "1"
		And User set auto buy lot to "1"
		And User click buy button in order page
		Then User "see" popup preview auto buy order
		And User click "cancel" button in preview auto buy order
		Then User "not see" popup preview auto buy order
		
	@TEST_ATI-1236 @TESTSET_ATI-1235 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoBuy @Automated @OnTrading @Positive @SetAutoBuy @iOS
	Scenario: [iOS][Auto Buy] User set auto buy
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_TRX_USERNAME"
		And User input password as "TRADING_TRX_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User clear smart order using api
		And User buy "BUKA" from watchlist
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User set auto buy trigger condition to "<="
		And User set auto buy trigger price to "1"
		And User set auto buy price to "1"
		And User set auto buy lot to "1"
		And User click buy button in order page
		And User "see" popup preview auto buy order
		And User click "confirm" button in preview auto buy order
		And User click done in popup success order
		And User click portfolio menu
		And User click "order" tab in portfolio page
		And User click "order" tab in order tab section
		And User see success set auto buy
		
	#Auto Sell
	@TEST_ATI-1258 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @OnTrading @Positive @SetAutoOrderSellToStopLoss @iOS
	Scenario: [iOS][Auto Sell] User set auto order to stop loss
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "1" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User click "Stop Loss" in popup auto order
		And User see "Stop Loss" order page
		And User see submit button auto order is "disable"
		And User set auto order lot to "1"
		And User set price auto order sell lowest than current price
		And User see submit button auto order is "enable"
		And User click submit button in order page
		Then User see success set auto order to "Stop Loss"
		
	@TEST_ATI-1261 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @OnTrading @Positive @SetAutoOrdeSellSeeTnCOneTime @iOS
	Scenario: [iOS][Auto Buy] User see tnc auto sell one time
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User get portfolio data using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User see next button is "disabled" in term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User see next button is "enable" in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User close popup auto order
		And User click auto order in portfolio detail
		Then User see popup auto order
		
	@TEST_ATI-1262 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @OnTrading @Positive @SetAutoOrderSellTakeProfit @iOS
	Scenario: [iOS][Auto Sell] User set auto order to take profit
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "1" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User click "Take Profit" in popup auto order
		And User see "Take Profit" order page
		And User set auto order lot to "1"
		And User set price auto order sell highest than current price
		And User click submit button in order page
		Then User see success set auto order to "Take Profit"
		
	@TEST_ATI-1263 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @EditAutoOrderSell @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User edit auto order stop loss
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Stop Loss" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click edit auto order type "Stop Loss" in portfolio detail
		And User see "Stop Loss" order page
		And User set auto order lot to "2"
		And User set auto order price to "2"
		And User click submit button in order page
		Then User see success edit auto order to "Stop Loss"
		
	@TEST_ATI-1264 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @EditAutoOrderSell @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User edit auto order Take Profit
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Take Profit" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click edit auto order type "Take Profit" in portfolio detail
		And User see "Take Profit" order page
		And User set auto order lot to "2"
		And User set auto order price to "2"
		And User click submit button in order page
		Then User see success edit auto order to "Take Profit"
		
	@TEST_ATI-1265 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @DeleteAutoOrderStopLoss @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User delete auto order stop loss
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Stop Loss" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User delete auto order type "Stop Loss"
		Then User success delete auto order
		
	@TEST_ATI-1266 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @DeleteAutoOrderTakeProfit @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User delete auto order take profit
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Take Profit" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User delete auto order type "Take Profit"
		Then User success delete auto order
		
	@TEST_ATI-1267 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @CannotSetMoreThan2AutoOrderSellInOneStock @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User cannot set more than 2 auto order in one stock
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Take Profit" using api
		And User create smart order sell "Stop Loss" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		Then User cannot set more than 2 auto order in one stock
		
	@TEST_ATI-1268 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @DeleteAllAutoOrderSell @OnTrading @Positive @iOS
	Scenario: [iOS][Auto Sell] User delete all auto order sell
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "2" using api
		And User create smart order sell "Stop Loss" using api
		And User create smart order sell "Take Profit" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User delete auto order type "Stop Loss"
		And User delete auto order type "Take Profit"
		Then User see auto order entry point in portfolio detail
		
	@TEST_ATI-1285 @TESTSET_ATI-1257 @TESTSET_ATI-1430 @TESTSET_ATI-2461 @AutoOrderSell @Automated @CommonOrderAutoOrderSell @OnTrading @Positive @iOS
	Scenario Outline: [iOS][Auto Sell] Common order auto order sell
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User check lot balance greater than "3" using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click one of portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User click "<type>" in popup auto order
		And User see "<type>" order page
		And User set auto order lot to "1"
		And User click add "3" auto order lot sell
		And User click subtract "3" auto order lot sell
		And User see final auto order lot sell will be "1"
		And User set auto order price to "1"
		And User click add "3" auto order price sell
		And User click subtract "3" auto order price sell
		Then User see final auto order price sell will be "1"
		
			Examples:
				| type        |
				| Stop Loss   |
				| Take Profit |
		
	@TEST_ATI-1495 @TESTSET_ATI-251 @Automated @ClearFieldUsernameLogin @CommonFeature @Login @Positive @iOS
	Scenario: [iOS] User clear field username login
		Given User is on stockbit landingpage
		When User click login
		And User input username as "username"
		And User click clear username field
		Then User see field username is cleared
		
	@TEST_ATI-1240 @TESTSET_ATI-1235 @TESTSET_ATI-2461 @AmendAutoBuy @AutoBuy @Automated @OnTrading @Positive @iOS
	Scenario: [iOS][Real Buy][Auto Buy] User amend auto buy
		Given User login using "TRADING_TRX" account
		And User login to securities with pin "TRADING_TRX_PIN" using api
		And User clear smart order using api
		And User create smart order buy for "BUKA" stock using api
		And User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "order" tab in portfolio page
		And User click "order" tab in order tab section
		And User click list auto buy order
		And User see "auto buy" order detail
		And User click "amend" auto buy
		And User see amend order page
		And User set auto buy trigger price to "2"
		And User set auto buy price to "2"
		And User click amend order
		And User "see" popup preview amend order
		And User click "confirm" in popup preview amend order
		And User see popup success amend buy order
		And User click done in popup success order
		Then User success amend order auto buy
		
	@TEST_ATI-1238 @TESTSET_ATI-1235 @TESTSET_ATI-2461 @AutoBuy @Automated @CancelAmendAutoBuy @OnTrading @Positive @iOS
	Scenario: [iOS][Real Buy][Auto Buy] User cancel amend auto buy
		Given User login using "TRADING_TRX" account
		When User login to securities with pin "TRADING_TRX_PIN" using api
		And User clear smart order using api
		And User create smart order buy for "BUKA" stock using api
		And User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "order" tab in portfolio page
		And User click "order" tab in order tab section
		And User click list auto buy order
		And User see "auto buy" order detail
		And User click "amend" auto buy
		And User see amend order page
		And User set auto buy trigger price to "2"
		And User set auto buy price to "2"
		And User click amend order
		And User "see" popup preview amend order
		And User click "cancel" in popup preview amend order
		Then User "not see" popup preview amend order
		
	@TEST_ATI-1237 @TESTSET_ATI-1235 @TESTSET_ATI-2461 @AutoBuy @Automated @CancelAutoBuy @OnTrading @Positive @iOS
	Scenario: [iOS][Real Buy][Auto Buy] User cancel auto buy
		Given User login using "TRADING_TRX" account
		When User login to securities with pin "TRADING_TRX_PIN" using api
		And User clear smart order using api
		And User create smart order buy for "BUKA" stock using api
		And User click portfolio menu
		And User input trading pin "TRADING_TRX_PIN"
		And User click "nanti" in popup smart login
		And User click "order" tab in portfolio page
		And User click "order" tab in order tab section
		And User click list auto buy order
		And User see "auto buy" order detail
		And User click "cancel order" auto buy
		And User click cancel in popup confirmation cancel order
		Then User status auto buy is "withdrawn"
		
	@TEST_ATI-1194 @TESTSET_ATI-515 @TESTSET_ATI-2130 @Automated @CommonFeature @ForgotPINTrading @ForgotPin @Positive @iOS
	Scenario: [iOS] User forgot trading PIN from portfolio page
		Given User login using "TRADING" account
		When User click portfolio menu
		And User click lupa pin trading
		And User input nomor ktp "NIK"
		And User click kirim button
		Then User see input otp page
		
	@TEST_ATI-1738 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserEditGender @iOS
	Scenario: [iOS] User edit gender from edit profile page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User edit gender
		And User click button Save
		Then User validate success edit gender
		
	@TEST_ATI-1737 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserRemoveProfilePictureAvatar @iOS
	Scenario: [iOS] User remove profile picture from edit profile page
		Given User login using "NON_TRADING2" account
		When User set profile picture using api
		And User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click remove profile picture button
		And User click button Save
		Then User validate profile picture is removed
		
	@TEST_ATI-1736 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserCancelChangeProfilePictureGallery @iOS
	Scenario: [iOS] User cancel change profile picture using photo from gallery
		Given User login using "NON_TRADING2" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click gallery button
		And User select one of photos from gallery
		And User click "CANCEL" photo button
		Then User see personal detail page
		
	@TEST_ATI-1735 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserRemoveProfilePictureGallery @iOS
	Scenario: [iOS] User remove profile picture Gallery from edit profile page
		Given User login using "NON_TRADING2" account
		When User upload avatar from gallery using api
		And User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click remove profile picture button
		And User click button Save
		Then User validate profile picture is removed
		
	@TEST_ATI-1734 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserCancelChangeProfilePictureAvatar @iOS
	Scenario: [iOS] User cancel change profile picture using avatar profile
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click show more avatars
		And User click back from popup choose avatar
		Then User see popup choose avatar
		
	@TEST_ATI-1733 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserChangeProfilePictureGallery @iOS
	Scenario: [iOS] User change profile picture using photo from gallery
		Given User login using "NON_TRADING2" account
		When User get avatar using api
		And User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click gallery button
		And User select one of photos from gallery
		And User click "CHOOSE" photo button
		Then User success change profile picture from "GALLERY"
		
	@TEST_ATI-1732 @TESTSET_ATI-442 @TESTSET_ATI-2129 @Automated @CommonFeature @Positive @Profile @UserChangeProfilePictureAvatar @iOS
	Scenario: [iOS] User change profile picture using avatar profile
		Given User login using "TRADING" account
		When User click side profile icon
		And User click view profile
		And User click edit profile
		And User see personal detail page
		And User click change profile picture
		And User click show more avatars
		And User choose one of avatar list
		And User see checklist in avatar choosed
		And User click save avatar button from edit profile page
		And User click button Save
		Then User success change profile picture from "AVATAR"
		
	@TEST_ATI-1764 @TESTSET_ATI-1769 @Automated @OnTrading @Orderbook @Positive @VerifyBidAskOrderBookBuy @iOS
	Scenario Outline: [iOS] User verify bid and ask data in order book buy
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User check "<orderBook>" list data is available
		And User click one of "<orderBook>" list
		Then User see price order "Buy" is match with selected "<orderBook>"
		
			Examples:
				| orderBook |
				| bid       |
				| ask       |
		
	@TEST_ATI-1782 @TESTSET_ATI-1783 @Automated @CommonFeature @Language @Positive @SetAppsLanguage @iOS
	Scenario Outline: [iOS] User set apps language
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "LANGUAGE" in setting list menu
		And User see "LANGUAGE" setting page
		And User choose apps language "<language>" in "settings" page
		And User see popup confirmation apps language setting
		And User click "YES" button on popup confirmation apps language setting
		Then User verify success change apps language
		
			Examples:
				| language |
				| EN       |
				| ID       |
		
	@TEST_ATI-1781 @TESTSET_ATI-1783 @Automated @CancelSetAppsLanguage @CommonFeature @Language @Positive @iOS
	Scenario: [iOS] User cancel set apps language
		Given User login using "NON_TRADING" account
		When User click side profile icon
		And User click "LANGUAGE" in setting list menu
		And User see "LANGUAGE" setting page
		And User choose not selected apps language
		And User click "NO" button on popup confirmation apps language setting
		And User click back button 1 times
		Then User verify success change apps language
		
	@TEST_ATI-1861 @TESTSET_ATI-1769 @Automated @OnTrading @Orderbook @Positive @VerifyBidAskOrderBookAutoBuy @iOS
	Scenario Outline: [iOS] [Auto Buy] User verify bid and ask data in order book auto buy
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User buy "BUKA" from watchlist
		And User click order type entry point in order page
		And User see order type popup in order page
		And User choose "Auto Buy" in popup order type order page
		And User see term and condition auto buy
		And User click checkbox radio button in term and condition auto buy
		And User click next button in term and condition auto buy
		And User see success choose "Auto Buy" in order page
		And User check "<orderBook>" list data is available
		And User click one of "<orderBook>" list
		Then User see price order "Auto Buy" is match with selected "<orderBook>"
		
			Examples:
				| orderBook |
				| bid       |
				| ask       |
		
	@TEST_ATI-1972 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyUsingAskPrice @OnTrading @OrderBookBuy @Positive @iOS
	Scenario: [iOS][Real Trading] User buy with ask price list
		Given User login using "TRADING3" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User real buy "TRADING_STOCK_SYMBOL" from watchlist
		And User check "ask" list data is available
		And User click one of "ask" list
		And User set real order lot buy "1"
		And User click buy button in real buy order page
		And User see popup preview buy order
		And User click "CONFIRM" button in popup preview order
		And User click done in popup success order
		And User click portfolio menu
		And User click "ORDER" tab in portfolio page
		Then User see status order "MATCH"
		
	@TEST_ATI-1957 @TESTSET_ATI-1769 @Automated @OnTrading @Orderbook @Positive @VerifyBidAskOrderBookAutoSellStopLoss @iOS
	Scenario Outline: [iOS] [Auto Sell] User verify bid and ask data in order book auto sell to stop loss
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click "TRADING_STOCK_SYMBOL" in portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User click "Stop Loss" in popup auto order
		And User see "Stop Loss" order page
		And User check "<orderBook>" list data is available
		And User click one of "<orderBook>" list
		Then User see price order "Auto Sell" is match with selected "<orderBook>"
		
			Examples:
				| orderBook |
				| bid       |
				| ask       |
		
	@TEST_ATI-1958 @TESTSET_ATI-1769 @Automated @OnTrading @Orderbook @Positive @VerifyBidAskOrderBookSell @iOS
	Scenario Outline: [iOS] User verify bid and ask data in order book sell
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click "TRADING_STOCK_SYMBOL" in portfolio list
		And User click sell button in portfolio detail page
		And User check "<orderBook>" list data is available
		And User click one of "<orderBook>" list
		Then User see price order "Sell" is match with selected "<orderBook>"
		
			Examples:
				| orderBook |
				| bid       |
				| ask       |
		
	@TEST_ATI-1959 @TESTSET_ATI-1769 @Automated @OnTrading @Orderbook @Positive @VerifyBidAskOrderBookAutoSellTakeProfit @iOS
	Scenario Outline: [iOS] [Auto Sell] User verify bid and ask data in order book auto sell to take profit
		Given User login using "TRADING" account
		When User click portfolio menu
		And User login to securities with pin "PIN_TRADING" using api
		And User clear smart order using api
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click "TRADING_STOCK_SYMBOL" in portfolio list
		And User click auto order in portfolio detail
		And User see term and condition auto sell
		And User click checkbox radio button in term and condition auto sell
		And User click next button in term and condition auto sell
		And User see popup auto order
		And User click "Take Profit" in popup auto order
		And User see "Take Profit" order page
		And User check "<orderBook>" list data is available
		And User click one of "<orderBook>" list
		Then User see price order "Auto Sell" is match with selected "<orderBook>"
		
			Examples:
				| orderBook |
				| bid       |
				| ask       |
		
	@TEST_ATI-2111 @TESTSET_ATI-306 @TESTSET_ATI-2461 @Automated @BuyUsingBidPrice @OnTrading @OrderBookBuy @Positive @iOS
	Scenario: [iOS][Real Trading] User buy with bid price list
		Given User login using "TRADING3" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING3"
		And User click "nanti" in popup smart login
		And User click watchlist menu
		And User real buy "TRADING_STOCK_SYMBOL" from watchlist
		And User check "bid" list data is available
		And User click one of "bid" list
		And User set real order lot buy "1"
		And User click buy button in real buy order page
		And User see popup preview buy order
		And User click "CONFIRM" button in popup preview order
		And User click done in popup success order
		And User click portfolio menu
		And User click "ORDER" tab in portfolio page
		Then User see status order "OPEN"
		And User click newest order list
		And User click "CANCEL ORDER" button in order detail
		And User click cancel in popup confirmation cancel order
		And User click newest order list
		Then User see status order "WITHDRAWN"
		
	@TEST_ATI-2272 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @GifOnlyMessage @Positive @iOS
	Scenario: [iOS] User Send message with GIF only
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User open GIF menu
		And User choose first GIF
		Then Correct GIF message is sent to recipient
		
	@TEST_ATI-2271 @TESTSET_ATI-533 @TESTSET_ATI-2210 @Automated @Chat @CommonFeature @Positive @StickerOnlyMessage @iOS
	Scenario: [iOS] User Send message with sticker only
		Given User login using "TRADING" account
		When User click chat menu
		And User start chat with "NON_TRADING_USERNAME"
		And User open sticker menu
		And User choose first sticker
		Then Correct sticker message is sent to recipient
		
	@TEST_ATI-2274 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SendGroupChatSticker @iOS
	Scenario: [iOS][Group Chat] User create group chat and send chat sticker only
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User send chat sticker only in group chat
		Then User success send chat sticker in group chat
		
	@TEST_ATI-2273 @TESTSET_ATI-1188 @TESTSET_ATI-2210 @Automated @CommonFeature @GroupChat @Positive @SendGroupChatGif @iOS
	Scenario: [iOS][Group Chat] User create group chat and send chat GIF only
		Given User login using "TRADING" account
		When User click chat menu
		And User create group chat with "NON_TRADING_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User send chat GIF only in group chat
		Then User success send chat GIF in group chat
		
	@TEST_ATI-422 @TESTSET_ATI-421 @CommonFeature @NotificationSetting @Positive @SetSocialNotification @iOS
	Scenario Outline: [iOS] User Setting Social Notification
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User click side profile icon
		And User click "Notification" in setting list menu
		And User see "Notification" setting page
		And User set "<notifications>" notification to "Disable"
		And User see success set "<notifications>" notification to "Disable"
		And User set "<notifications>" notification to "Enable"
		And User see success set "<notifications>" notification to "Enable"
		And User set "<notifications>" notification to "Disable"
		Then User see success set "<notifications>" notification to "Disable"
		
			Examples:
				| notifications       |
				| Mentions            |
				| Followed            |
				| Likes               |
				| Replies             |
				| Reposts             |
				| Followed Users Post |
				| Friend On Stockbit  |
		
	@TEST_ATI-423 @TESTSET_ATI-421 @CommonFeature @NotificationSetting @Positive @SetChatNotification @iOS
	Scenario Outline: [iOS] User Setting Chat Notification
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User click side profile icon
		And User click "Notification" in setting list menu
		And User see "Notification" setting page
		And User set "<notifications>" notification to "Disable"
		And User see success set "<notifications>" notification to "Disable"
		And User set "<notifications>" notification to "Enable"
		And User see success set "<notifications>" notification to "Enable"
		And User set "<notifications>" notification to "Disable"
		Then User see success set "<notifications>" notification to "Disable"
		
			Examples:
				| notifications   |
				| Personal Chat   |
				| Group Chat      |
				| Message Request |
		
	@TEST_ATI-424 @TESTSET_ATI-421 @CommonFeature @NotificationSetting @Positive @SetTippingNotification @iOS
	Scenario Outline: [iOS] User Setting Tipping Notification
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User click side profile icon
		And User click "Notification" in setting list menu
		And User see "Notification" setting page
		And User set "<notifications>" notification to "Disable"
		And User see success set "<notifications>" notification to "Disable"
		And User set "<notifications>" notification to "Enable"
		And User see success set "<notifications>" notification to "Enable"
		And User set "<notifications>" notification to "Disable"
		Then User see success set "<notifications>" notification to "Disable"
		
			Examples:
				| notifications    |
				| Tipping Received |
				| Tipping Sent     |
		
	@TEST_ATI-611 @TESTSET_ATI-421 @CommonFeature @NotificationOtherSetting @NotificationSetting @Positive @iOS
	Scenario Outline: [iOS] User Setting Other Notification
		Given User is on stockbit landingpage
		When User click login
		And User input username as "TRADING_USERNAME"
		And User input password as "TRADING_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User click side profile icon
		And User click "Notification" in setting list menu
		And User see "Notification" setting page
		And User set "<notifications>" notification to "Disable"
		And User see success set "<notifications>" notification to "Disable"
		And User set "<notifications>" notification to "Enable"
		And User see success set "<notifications>" notification to "Enable"
		And User set "<notifications>" notification to "Disable"
		Then User see success set "<notifications>" notification to "Disable"
		
			Examples:
				| notifications        |
				| Company News         |
				| Company Announcement |
				| Price Alert          |
				| Trending Stocks      |
		
	@TEST_ATI-2332 @TESTSET_ATI-474 @Automated @CommonFeature @Positive @Search @ShortlistMutualFunds @iOS
	Scenario Outline: [iOS] User Sort list on discover mutual funds
		Given User login using "TRADING" account
		When User click search menu
		And User see tabs in search page
		And User click "REKSADANA" tab in search page
		And User see "REKSADANA" section in search page
		And User go to mutual funds "Pasar Uang" list page
		And User sort mutual funds list by "<criteria>"
		Then User see mutual funds list will be sorted by "<criteria>"
		
			Examples:
				| criteria      |
				| Top Gainer    |
				| Top Loser     |
				| Highest Price |
				| Lowest Price  |
		
	@TEST_ATI-2387 @TESTSET_ATI-520 @Automated @Calendar @CommonFeature @NoEvents @Positive @iOS
	Scenario: [iOS] User find no events available in calendar
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User expand calendar section
		And User see full expanded calender
		And User set date to next "1" day
		Then User see no events available
		
	@TEST_ATI-2381 @TESTSET_ATI-520 @Automated @Calendar @CommonFeature @MoveDate @Positive @iOS
	Scenario: [iOS] User move date with expand calendar
		Given User login using "TRADING" account
		When User click search menu
		And User click calender entry point
		And User expand calendar section
		And User see full expanded calender
		And User set date to next "2" day
		Then User see the events on the selected day
		
	@TEST_ATI-2499 @TESTSET_ATI-2500 @Automated @CommonFeature @Positive @SeeBrokerActivityFromPopUp @TopBroker @iOS
	Scenario: [iOS] User see broker activity page from broker code pop up
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User click tooltips button on the right top corner from Top Broker page
		And User click broker code "ALL" in pop up
		And User see broker code list from "ALL"
		And User click one of broker code
		Then User see broker activity of selected broker
		
	@TEST_ATI-2498 @TESTSET_ATI-2500 @Automated @CommonFeature @Positive @SeeAllBrokerCodeTab @TopBroker @iOS
	Scenario Outline: [iOS] User see all broker code tabs
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User click tooltips button on the right top corner from Top Broker page
		And User click broker code "<group>" in pop up
		Then User see broker code list from "<group>"
		
			Examples:
				| group   |
				| ALL     |
				| LOCAL   |
				| BUMN    |
				| FOREIGN |
		
	@TEST_ATI-2497 @TESTSET_ATI-2500 @Automated @CommonFeature @Positive @SeeBrokerActivityFromTopBroker @TopBroker @iOS
	Scenario: [iOS] User see broker activity page from top broker page
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		Then User see broker activity of selected broker
		
	@TEST_ATI-2512 @TESTSET_ATI-2500 @Automated @BackFromBrokerActivityPage @CommonFeature @Positive @TopBroker @iOS
	Scenario: [iOS] User back from broker activity page
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User click back button
		And User see top broker page
		And User click back button
		Then User see search page
		
	@TEST_ATI-2534 @TESTSET_ATI-2500 @Automated @CommonFeature @Positive @SortListTopBroker @TopBroker @iOS
	Scenario Outline: [iOS] User sort list on top broker by total value
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User sort top broker by "<T.Val>"
		Then User see top broker will be sorted by "<T.Val>"
		
			Examples:
				| T.Val       |
				| Low to high |
				| High to low |
		
	@TEST_ATI-2552 @TESTSET_ATI-559 @Automated @CommonFeature @ConnectContactsAndDisconnectContacts @FriendDiscovery @Positive @iOS
	Scenario: [iOS] User connect to contacts and disconnect contacts
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Contact Access" in privacy setting
		And User "ALLOW" discoverable by contacts
		And User see status "ALLOW" for discoverable by contacts
		And User "NOT ALLOW" discoverable by contacts
		Then User see status "NOT ALLOW" for discoverable by contacts
		
	@TEST_ATI-2551 @TESTSET_ATI-559 @Automated @CommonFeature @FriendDiscovery @ListDiscoverFriends @Positive @iOS
	Scenario: [iOS] User enable access contact then see list friends
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Contact Access" in privacy setting
		And User "ALLOW" sync contact data
		And User click "ALLOW" on popup connect to contact
		And User see status "ALLOW" for sync contact data
		And User click back button 2 times
		And User click "Discover People" in setting list menu
		And User click tab friends
		Then User will see sync contact data is activated in tab friends
		
	@TEST_ATI-2550 @TESTSET_ATI-559 @Automated @CommonFeature @DenyAccessContact @FriendDiscovery @Negative @iOS
	Scenario: [iOS] User cancel enable contact access
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Privacy" in setting list menu
		And User click "Contact Access" in privacy setting
		And User "ALLOW" sync contact data
		And User click "DONT ALLOW" on popup connect to contact
		Then User see status "NOT ALLOW" for sync contact data
		
	@TEST_ATI-2645 @TESTSET_ATI-2500 @Automated @ChangeBrokerNameSelected @OnTrading @Positive @TopBroker @iOS
	Scenario: [iOS] User change Broker name from Broker Activity page
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User click the selected broker
		And User click broker code "ALL" in pop up
		And User see broker code list from "ALL"
		And User select another broker code from pop up
		Then User see broker activity of selected broker is updated
		
	@TEST_ATI-2646 @TESTSET_ATI-2500 @Automated @FilterBrokerActivityByForeign @OnTrading @Positive @TopBroker @iOS
	Scenario: [iOS] User filter broker activity by foreign investor
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User select "Foreign" investor from dropdown
		And User filter broker activity by "Foreign"
			| market     |
			| All Market |
			| Regular    |
			| Tunai      |
			| Nego       |
		
	@TEST_ATI-2647 @TESTSET_ATI-2500 @Automated @FilterBrokerActivityByDomestic @OnTrading @Positive @TopBroker @iOS
	Scenario: [iOS] User filter broker activity by domestic investor
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User select "Domestic" investor from dropdown
		Then User filter broker activity by "Domestic"
			| market     |
			| All Market |
			| Regular    |
			| Tunai      |
			| Nego       |
		
	@TEST_ATI-2648 @TESTSET_ATI-2500 @Automated @FilterBrokerActivityByAllInvestor @OnTrading @Positive @TopBroker @iOS
	Scenario: [iOS] User filter broker activity by all investor
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User select "All Investor" investor from dropdown
		And User filter broker activity by "All Investor"
			| market     |
			| All Market |
			| Regular    |
			| Tunai      |
			| Nego       |
		
	@TEST_ATI-2735 @TESTSET_ATI-2500 @Automated @EmptyDataNextDay @OnTrading @Positive @TopBroker @iOS
	Scenario: [iOS] User see empty broker activity data when user changes to next day
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User click broker activity date range section
		And User change broker activity start date next "3" day
		And user change broker activity end date next "3" day
		And User set broker activity date
		Then User see empty broker activity data
		
	@TEST_ATI-2736 @TESTSET_ATI-2500 @Automated @OnTrading @Positive @SeeBrokerActivityFilteredByNetToggle @TopBroker @iOS
	Scenario: [iOS] User see broker activity data when user changes net toggle
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		Then User set net toggle to "disable"
		And User set net toggle to "enable"
		
	@TEST_ATI-2738 @TESTSET_ATI-2500 @Automated @OnTrading @Positive @SeeBrokerDataPreviousDay @TopBroker @iOS
	Scenario: [iOS] User see broker activity data when user changes to previous day
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User click broker activity date range section
		And User change broker activity start date previous "1" day
		And user change broker activity end date previous "1" day
		And User set broker activity date
		Then User see broker activity data sorted by date
		
	@TEST_ATI-2737 @TESTSET_ATI-2500 @Automated @OnTrading @Positive @SeeInstructionDescriptionOfNetToggle @TopBroker @iOS
	Scenario: [iOS] User see instruction description of net toggle
		Given User login using "TRADING" account
		When User click search menu
		And User click top broker entry point
		And User see top broker page
		And User get top broker using api
		And User click one of broker code
		And User see broker activity of selected broker
		And User click instruction button of net toggle
		Then User see instruction description of net toggle
		
	@TEST_ATI-2789 @TESTSET_ATI-2791 @Automated @OnTrading @OrderType @SearchProfession @TradingProfile @iOS
	Scenario: [iOS] User search profession in list profession list change trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		And User click change data button in trading profile
		And User input trading pin "PIN_TRADING"
		And User see change trading profile page
		And User click chevron field "profession"
		And User search "ONE LIST OF PROFESSION" in list profession
		Then User see search result of profession
		
	@TEST_ATI-2788 @TESTSET_ATI-2791 @Automated @OnTrading @OrderType @SearchNotAvailableProfession @TradingProfile @iOS
	Scenario: [iOS] User search not available profession in list profession list change trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		And User click change data button in trading profile
		And User input trading pin "PIN_TRADING"
		And User see change trading profile page
		And User click chevron field "profession"
		And User search "NOT AVAILABLE PROFESSION" in list profession
		Then User not see search result of profession
		
	@TEST_ATI-2787 @TESTSET_ATI-2791 @Automated @LeaveBlankCompanyName @OnTrading @OrderType @TradingProfile @iOS
	Scenario: [iOS] User leave blank company name trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		And User click change data button in trading profile
		And User input trading pin "PIN_TRADING"
		And User see change trading profile page
		And User input company name ""
		And User see alert "Nama Kantor/Institusi Pendidikan belum diisi" in change trading profile
		Then User see button send data is disabled
		
	@TEST_ATI-2786 @TESTSET_ATI-2791 @Automated @LeaveBlankCompanyAddress @OnTrading @OrderType @TradingProfile @iOS
	Scenario: [iOS] User leave blank company address trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		And User click change data button in trading profile
		And User input trading pin "PIN_TRADING"
		And User see change trading profile page
		And User input company address ""
		And User see alert "Alamat Kantor/Institusi Pendidikan belum diisi" in change trading profile
		Then User see button send data is disabled
		
	@TEST_ATI-2785 @TESTSET_ATI-2791 @Automated @LeaveBlankCompanyPhone @OnTrading @OrderType @TradingProfile @iOS
	Scenario: [iOS] User leave blank company phone trading profile
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "Account" in setting list menu
		And User click trading profile
		And User click change data button in trading profile
		And User input trading pin "PIN_TRADING"
		And User see change trading profile page
		And User input company phone ""
		And User see alert "Nomor Telepon Kantor/ Institusi Pendidikan belum diisi" in change trading profile
		Then User see button send data is disabled
		
	@TEST_ATI-2793 @TESTSET_ATI-2794 @Automated @EStatement @OnTrading @Positive @SendTaxReport @iOS
	Scenario: [iOS] User send E-Statement of tax report
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "E-Statement" in setting list menu
		And User see "E-Statement" setting page
		And User click "Tax Report" tab
		And User select tax period
		And User click send to email button
		And User "see" tax report confirmation popup
		And User close send e-statement confirmation popup
		And User "not see" tax report confirmation popup
		And User click send to email button
		And User "see" tax report confirmation popup
		And User click send e-statement button
		And User "not see" tax report confirmation popup
		Then User success send E-Statement of "tax report"
		
	@TEST_ATI-2792 @TESTSET_ATI-2794 @Automated @EStatement @OnTrading @Positive @SendTransactionHistory @iOS
	Scenario: [iOS] User send E-Statement of transaction history
		Given User login using "TRADING" account
		When User click portfolio menu
		And User input trading pin "PIN_TRADING"
		And User click "nanti" in popup smart login
		And User click side profile icon
		And User click "E-Statement" in setting list menu
		And User see "E-Statement" setting page
		And User click "Transaction History" tab
		And User see send to email button is disable
		And User select "start" date of transaction history period
		And User select "end" date of transaction history period
		And User see send to email button is enable
		And User click send to email button
		And User "see" transaction history confirmation popup
		And User close send e-statement confirmation popup
		And User "not see" transaction history confirmation popup
		And User click send to email button
		And User "see" transaction history confirmation popup
		And User click send e-statement button
		And User "not see" transaction history confirmation popup
		Then User success send E-Statement of "transaction history"
		
	@TEST_ATI-1519 @TESTSET_ATI-251 @Automated @CommonFeature @Login @LoginUsingGoogle @Positive @TakeOutFeature @iOS
	Scenario: [iOS] User login using google email
		Given User is on stockbit landingpage
		When User click login
		And User click login using "GOOGLE"
		And User login to "GOOGLE" using "GOOGLE_REGISTERED"
		Then User see watchlist page
		
	@TEST_ATI-3553 @TESTSET_ATI-326 @Automated @CommonFeature @PlayVideoOnLesson @Positive @StockbitAcademy @iOS
	Scenario: [iOS] [Academy] Watch youtube while reading a lesson
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click module "1" in explore module page
		And User see detail module "1" academy
		And User click chapter "1" in list chapter
		And User see lessons section in chapter page
		And User click lesson "1" from lesson list
		And User click play video in "lesson" page
		And User see video is played
		Then User can watch the video while read the lesson "1"
		
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
		
	#Pre condition:
	#Share detail portfolio.
	@TEST_ATI-1293 @OnTrading @Pending @Positive @SaveSharedDetailPortfolioOnStreamMenu @Stream @iOS
	Scenario: [iOS] [Stream] Save post of shared portfolio on stream page
		Given User is on stockbit landing page
		When User click login
		And User input username
		And User input password
		And User click login
		And User click stream
		And User click three dots on post shared portfolio
		And User click "Save" on post shared portfolio
		Then User success "save" post shared portfolio
		
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
		
	@TEST_ATI-3643 @TESTSET_ATI-326 @Automated @CommonFeature @ModuleAndPlayHomePageVideo @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] User play video in stockbit academy main page
		Given User login using "TRADING" account
		When User click side profile icon
		And User click "Stockbit Academy" in setting list menu
		And User see stockbit academy page
		And User click play video in "homepage" page
		Then User see video is played
		
	@TEST_ATI-472 @TESTSET_ATI-463 @Automated @CommonFeature @Negative @NonProAccountAccessScreener @Screener @TakeOutFeature @iOS
	Scenario: [iOS] User Non pro account cannot access screener and register securities
		Given User is on stockbit landingpage
		When User click login
		And User input username as "NON_TRADING_USERNAME"
		And User input password as "NON_TRADING_PASSWORD"
		And User click button login
		And User close profile avatar popup
		And User click search menu
		And User click screener entry point
		Then User see popup info for non pro account
		And User click buat account button for create stockbit pro
		And User click register securities entry point
		Then User see check valid "Phone Number" page
		And User click next button in check valid "phone number" page
		Then User see check valid "Email" page
		And User click next button in check valid "email address" page
		Then User see input otp page
		And User input otp "1111"
		Then User still in otp page
		
	@TEST_ATI-3745 @TESTSET_ATI-326 @Automated @CommonFeature @MoveToNextChapterFromLesson @Positive @StockbitAcademy @iOS
	Scenario: [iOS][Academy] Move to the next chapter from lesson page
		Given User login using "TRADING" account
		When User click search menu
		And User click stockbit academy entry point in search page
		And User see stockbit academy page
		And User click see all explore module stockbit academy
		And User click last module in list module
		And User click chapter "6" in list chapter
		And User see lessons section in chapter page
		And User click last lesson in detail chapter
		And User click next button in last lesson
		And User click "NEXT CHAPTER" in take quiz confirmation popup
		Then User see next chapter is chapter "7"
		
	@TEST_ATI-4017 @TESTSET_ATI-442 @Automated @CommonFeature @Positive @Profile @UserDeleteAllStreamPost @iOS
	Scenario: [iOS][Profile] User delete stream post from profile page
		Given User login using "TRADING" account
		When User delete all post using api
		When User click side profile icon
		And User click view profile
		And User click write a post button in profile page
		And User see compose page
		And User write a unique stream post
		And User click post stream button
		And User see the created post in profile page
		And User click three dot in one of stream post
		And User click "Delete" stream post
		And User click "Delete" button in popup delete post
		Then User success "Delete" post in profile page
		And User delete all post using api
		
	@TEST_ATI-4137 @TESTSET_ATI-1188 @Automated @CommonFeature @GroupChat @Positive @VerifyGroupChatNotDuplicate @iOS
	Scenario: [iOS] [Chat] Specific chat bubble from group chat not duplicated in other group chat room
		Given User login using "TRADING" account
		When User click Chat
		And User create group chat with "NON_TRADING_USERNAME,NON_TRADING2_USERNAME" as member using api
		And User click message from new group chat
		And User see room group chat page
		And User click more in room chat
		And User go to group info
		And User see group chat info page
		And User click search member group chat
		And User search member with name "NON_TRADING_USERNAME"
		And User click "NON_TRADING_USERNAME" in search result member
		And User click "chat" in popup member group chat page
		And User login using "NON_TRADING2" account via api
		And User accept room invitation using api
		And User send chat "Pantau saham hari ini" to group chat using api
		Then User "NOT SEE" new chat bubble in personal chat room
		And User click back button 3 times
		And User see room group chat page
		Then User "SEE" new chat bubble in group chat room
		
	@TEST_ATI-4138 @TESTSET_ATI-533 @Automated @Chat @CommonFeature @Positive @VerifyPersonalChatNotDuplicate @iOS
	Scenario: [iOS] [Chat] Specific chat bubble not duplicated in other chat room
		Given User login using "TRADING" account
		When User click Chat
		And User login using "NON_TRADING2" account via api
		And User send chat to "TRADING_USERNAME" with chat "Bahas saham hari ini" using api
		And User click chat with "NON_TRADING2_USERNAME" in list chat
		And User "SEE" new chat bubble in personal chat room
		And User click back button
		And User start chat with "NON_TRADING_USERNAME"
		And User "NOT SEE" new chat bubble in personal chat room
		And User click back button
		And User login using "NON_TRADING" account via api
		And User send chat to "TRADING_USERNAME" with chat "Mau bahas apa lagi?" using api
		And User click chat with "NON_TRADING_USERNAME" in list chat
		And User "SEE" new chat bubble in personal chat room
		And User click back button
		And User start chat with "NON_TRADING2_USERNAME"
		Then User "NOT SEE" new chat bubble in personal chat room
		
