Feature: [iOS] [Manual] Buy Stock Feature

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromCompanyPage
  Scenario: [iOS] [Manual] User buy stock limit order GFD from company page
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct to order page
    And User set buy lot to 1
    And User set order price buy to "5"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @SellStock @NotAutomated @iOS @Positive @TRM @SellStockFromCompanyPage
  Scenario: [iOS] [Manual] User sell stock limit order GFD from company page
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click sell button in company page
    Then User direct to order page
    And User set buy lot to 1
    And User set order price buy to "5"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click sell button
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyAutoRejectionUpperLimit
  Scenario: [iOS] [Manual] User buy with auto rejection upper limit
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct order page
    And User set price over upper limit
    And User set buy lot to 1
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button
    And User click "Confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see status order "REJECTED"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyAutoRejectionLowerLimit
  Scenario: [iOS] [Manual] User buy with auto rejection lower limit
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct order page
    And User set price over lower limit
    And User set buy lot to 1
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button
    And User click "Confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see status order "REJECTED"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyAutoRejectionMinimumPrice
  Scenario: [iOS] [Manual] Buy with auto rejection minimum price
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct order page
    And User set order price buy to "Minimum_Price"
    And User set buy lot to 1
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button
    And User click "Confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see status order "REJECTED"

  @BuyStock @NotAutomated @Positive @TRM @BuyAutoRejectionBidNotAvailable
  Scenario: [iOS] [Manual] Buy with auto rejection bid not available
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct to order page
    And User set order price to less 1 than lowest ask price
    And User set buy lot to 1
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click "Confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see status order "REJECTED"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyExceedTradingBalance
  Scenario: [iOS] [Manual] Buy with exceed trading balance
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct to order page
    And User set order lot buy "10000"
    Then User see error message in buy order page

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyCloseToHighestAskPrice
  Scenario: [iOS] [Manual] Buy with price close to highest ask price
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct to order page
    And User set buy to lot 1
    And User order price buy to less "1" than highest ask price
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromCompanyPage
  Scenario: [iOS] [Manual] User buy stock limit order GTC from company page
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click buy button in company page
    Then User direct to order page
    And User set buy to lot 1
    And User set order price buy to "100"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good Till Cancelled" for expiry setting
    And User click buy button
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @SellStock @NotAutomated @iOS @Positive @TRM @SellStockFromCompanyPage
  Scenario: [iOS] [Manual] User sell stock limit order GTC from company page
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click sell button in company page
    Then User direct to order page
    And User set buy to lot 1
    And User set order price buy to "100"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good Till Cancelled" for expiry setting
    And User click sell button
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @SellStock @NotAutomated @iOS @Positive @TRM @SellStockFromMyInvestmentCard
  Scenario: [iOS] [Manual] User sell stock from my investment card company page
    Given User login using "TRADING" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    Then User see "STOCK_SYMBOL" company page
    And User click my investment card
    Then User will direct to porfolio detail
    And User click sell button in portfolio detail page
    And User set order lot sell "1"
    And User set order price sell to "100"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click sell button in portfolio detail page
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromPortfolio
  Scenario: [iOS] [Manual] User swipe and to buy from portfolio GFD
    Given User login using "TRADING" account
    When User click portfolio menu
    And User input trading pin "PIN_TRADING"
    And User click "nanti" in popup smart login
    And User swipe left on a "STOCK_SYMBOL" in the portfolio list
    And User click buy button
    Then User direct to order page
    And User set order price buy to "50"
    And User set buy lot to "1"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button in order page
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromPortfolio
  Scenario: [iOS] [Manual] User swipe to buy from portfolio GTC
    Given User login using "TRADING" account
    When User click portfolio menu
    And User input trading pin "PIN_TRADING"
    And User click "nanti" in popup smart login
    And User swipe left on "STOCK_SYMBOL" in the portfolio list
    And User click buy button
    Then User will redirect order page
    And User set auto buy lot to "1"
    And User set order price buy to "59"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good Till Cancelled" for expiry setting
    And User click buy botton
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And user will direct to order list
    Then User see order status "OPEN|MATCH"

  @SellStock @NotAutomated @iOS @Positive @TRM @SellStockFromPortfolio
  Scenario: [iOS] [Manual] User swipe and click sell from portfolio GFD
    Given User login using "TRADING" account
    When User click portfolio menu
    And User input trading pin "PIN_TRADING"
    And User click "nanti" in popup smart login
    And User swipe left on a "STOCK_SYMBOL" in the portfolio list
    And User click sell on a "STOCK_SYMBOL"
    Then User direct to order page
    And User set order price sell to "70"
    And User set sell lot to "1"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click sell button in order page
    And User click "confirm" button in preview order
    And User click "selesai" button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromPredictions
  Scenario: [iOS] [Manual] User buy stock from prediction in stream GFD
    Given User login using "TRADING" account
    When User click Stream
    And User click option icon on stream "submenu"
    And User choose "prediksi"
    And User click button "Terapkan"
    And User find stream containt "STOCK_SYMBOL" and button buy
    And User click button "beli"
    Then User direct to order page
    And User set order lot buy "1"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good For Day" for expiry setting
    And User click buy button in order page
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

  @BuyStock @NotAutomated @iOS @Positive @TRM @BuyStockFromPredictions
  Scenario: [iOS] [Manual] User buy stock from predictions in stream GTC
    Given User login using "TRADING" account
    When User click stream menu
    And User click option icon on stream "submenu"
    And User choose "prediksi"
    And User click button "Terapkan"
    And User find stream containt "STOCK_SYMBOL" and button buy
    And User click button "beli"
    Then User direct to order page
    And User set order lot buy "1"
    And User click dropdown expiry setting
    And User see popup expiry setting
    And User choose "Good Till Cancelled" for expiry setting
    And User click buy button in order page
    And User click "confirm" button in preview order
    And User click selesai button in popup success create order
    And User will direct to order list
    Then User see order status "OPEN|MATCH"

