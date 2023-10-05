Feature: [iOS] Company Page Feature

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Keystats In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "KEY STATS" in company page
    Then User click "KEY_STATS" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User Select Metric Revenue on Keystats In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "KEY STATS" in company page
    And User click "Net Income"
    And User see popup Select Metric
    And User click "REVENUE"
    Then User can see sales summary "STOCK_SYMBOL"

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Orderbook In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "<orderbook>" in company page
    Then User click "<orderbook>" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Running Trade in Orderbook at Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User scroll to "<running trade>" section
    And User see "<running trade>"
    And User click "LIHAT_SEMUA"
    Then User can see "<running trade>" detail

  @CompanyPage @NotAutomated @iOS @Positive @IDC @SeeTradeBookDetail
  Scenario Outline: [iOS] [CompanyPage] User See Trade Book in Orderbook at Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User scroll to "<tradebook>" section
    And User click icon information detail
    Then User See popup "<tradebook>"

        Examples:
        |tradebook|
        |Price    |
        |Time     |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @ChangeBrokerSummaryDate
  Scenario: [iOS] [CompanyPage] User See Trade Book in Orderbook at Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User scroll to "broker summary" section
    And User change broker summary date from "Sep 29, 2023" to "Oct 03, 2023"
    Then User see broker summary data based on selected date

  @CompanyPage @NotAutomated @iOS @Positive @IDC @ChangeBrokerSummaryDate
  Scenario Outline: [iOS] [CompanyPage] User See Trade Book in Orderbook at Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User scroll to "broker summary" section
    And User change "<investor type>", "<market type>", "<transaction type>" on broker summary
    Then User see broker summary data

      Examples:
      | investor type | market type | transaction type |
      | All Investor  | All Market  | Net              |
      | All Investor  | All Market  | Gross            |
      | All Investor  | Regular     | Net              |
      | All Investor  | Regular     | Gross            |
      | All Investor  | Tunai       | Net              |
      | All Investor  | Tunai       | Gross            |
      | All Investor  | Nego        | Net              |
      | All Investor  | Nego        | Gross            |
      | Domestic      | All Market  | Net              |
      | Domestic      | All Market  | Gross            |
      | Domestic      | Regular     | Net              |
      | Domestic      | Regular     | Gross            |
      | Domestic      | Tunai       | Net              |
      | Domestic      | Tunai       | Gross            |
      | Domestic      | Nego        | Net              |
      | Domestic      | Nego        | Gross            |
      | Foreign       | All Market  | Net              |
      | Foreign       | All Market  | Gross            |
      | Foreign       | Regular     | Net              |
      | Foreign       | Regular     | Gross            |
      | Foreign       | Tunai       | Net              |
      | Foreign       | Tunai       | Gross            |
      | Foreign       | Nego        | Net              |
      | Foreign       | Nego        | Gross            |


  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Analysis In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "ANALYSIS" in company page
    Then User click "ANALYSIS" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Finansial In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "FINANSIAL" in company page
    Then User click "FINANSIAL" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario Outline: [iOS] [CompanyPage] User switch Financial Statement on Financials company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "FINANSIAL" in company page
    And User switch "<financial statement>"
    Then User see financial statement based on selected
    Examples:
      | financial statement |
      | Income Statement    |
      | Balance Sheet       |
      | Cash Flow           |

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario Outline: [iOS] [CompanyPage] User switch Financial statement period on financials company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "FINANSIAL" in company page
    And User switch "<financial statement period>" period
    Then User see financial statement period based on selected dropdown
    Examples:
      | financial statement period |
      | Quarterly                  |
      | Annual                     |
      | TTM                        |
      | Interim YTD                |
      | Q1                         |
      | Q2                         |
      | Q3                         |
      | Q4                         |
      | QoQ Growth                 |
      | Quarter YoY Growth         |
      | YTD YoY Growth             |
      | Annual Yoy Growth          |
      | 3 Year CAGR                |

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario Outline: [iOS] [CompanyPage] User switch financial statement by currency or percentage company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "FINANSIAL" in company page
    And User switch "<financial unit>"
    Then User see financial unit based on currency or percentage
    Examples:
      | financial unit |
      | currency       |
      | percentage     |

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Seasonality In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "SEASONALITY" in company page
    Then User click "SEASONALITY" in company page

  @CompanyPage @NotAutomated @SwitchSeasonalityPeriod @Positive @IDC
  Scenario Outline: [iOS] [CompanyPage] [Manual] User switch seasonality chart period
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "SEASONALITY" in company page
    And User click seasonality "<chart period>"
    Then user see seasonality chart based on selected period
      Examples:
  | chart period |
  | 1 tahun     |
  | 2 tahun     |
  | 3 tahun     |
  | 4 tahun     |
  | 5 tahun     |
  | 6 tahun     |
  | 7 tahun     |
  | 8 tahun     |
  | 9 tahun     |
  | 10 tahun    |
  | 11 tahun    |
  | 12 tahun    |
  | 13 tahun    |
  | 14 tahun    |
  | 15 taun     |
  | 16 tahun    |
  | 17 tahun    |

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Perbandingan In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "PERBANDINGAN" in company page
    Then User click "PERBANDINGAN" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Corp Action In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "CORP ACTION" in company page
    Then User click "CORP ACTION" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Insider In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "INSIDER" insider page
    Then User click "INSIDER" in company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] User See Profil In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "PROFIL" insider page
    Then User click "PROFIL" in company page

  @CompanyPage @NotAutomate @iOS @Positive @CompanyBackground @IDC @Manual
    Scenario: [iOS] [CompanyPage] [Manual] User show more Company Background on Company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "PROFIL" insider page
    And User click "<show more>"
    Then User see more complete Company Background

  @CompanyPage @NotAutomated @iOS @Positive @SwitchShareholderComposition @Manual @IDC
    Scenario Outline: [iOS] [CompanyPage] [Manual] User switch Shareholder Composition
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "PROFIL" insider page
    And User scroll to shareholder composition
    And User change <"investor type">, "<date>"
    Then User see shareholder composition data with selected option
        Examples:
          | investor type | date    |
          | all           | 5 bulan |
          | all           | 1 tahun |
          | all           | 2 tahun |
          | all           | 3 tahun |
          | local         | 5 bulan |
          | local         | 1 tahun |
          | local         | 2 tahun |
          | local         | 3 tahun |
          | foreign       | 5 bulan |
          | foreign       | 1 tahun |
          | foreign       | 2 tahun |
          | foreign       | 3 tahun |

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] [Manual] User add stock to watchlist through company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User click following in company page
    And User save to all watchlist
    Then User successfully add stock to All Watchlist

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] [Manual] User remove stock to watchlist through company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User click following in company page
    And User remove to all watchlist
    Then User successfully remove stock to All Watchlist

  @CompanyPage @NotAutomated @iOS @Positive @IDC
  Scenario: [iOS] [CompanyPage] [Manual] User share stock company page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see share button in company page
    And User click share button
    And User click share via "BASIC SHARE" in popup company page share
    Then User success share company page via "BASIC SHARE"