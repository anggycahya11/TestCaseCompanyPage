Feature: [iOS] Company Page Feature

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaCompanyPage
    Scenario Outline: [iOS] [Manual] User access company page via strean at company page
      Given User login using "Trading" account
      When User click stream menu
      And User click "<section>" with "<selection>" option
      And User find stream post with contain "STOCK_SYMBOL"
      And User click "STOCK_SYMBOL"
      Then User will redirect to "STOCK_SYMBOL" company page
      Examples:
          | section           | selection          |
          | Stream            | Trending           |
          | Stream            | Followed           |
          | Stream            | All                |
          | Stream            | People             |
          | Stream            | Watchlist          |
          | Reports           | All                |
          | Reports           | Laporan Keuangan   |
          | Reports           | RUPS/Public Expose |
          | Reports           | Kepimilikan saham  |
          | Reports           | Dividend           |
          | Reports           | Corp. Action       |
          | Reports           | Lainnya            |
          | Prediksi          |                    |
          | Polling           |                    |
          | Insider           |                    |
          | Charts            |                    |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaComment
    Scenario Outline: [iOS] [Manual] [IDC] User access company page via comment
      Given User login using "Trading" account
      And User click stream menu
      And User click "<section>" with "<selection>" option
      And User click icon comment on post
      And User find comment stream with "STOCK_SYMBOL"
      And User click "STOCK_SYMBOL"
      And User click "<section>" with "<selection>" option
    Examples:
      | section           | selection          |
      | Stream            | Trending           |
      | Stream            | Followed           |
      | Stream            | All                |
      | Stream            | People             |
      | Stream            | Watchlist          |
      | Reports           | All                |
      | Reports           | Laporan Keuangan   |
      | Reports           | RUPS/Public Expose |
      | Reports           | Kepimilikan saham  |
      | Reports           | Dividend           |
      | Reports           | Corp. Action       |
      | Reports           | Lainnya            |
      | Prediksi          |                    |
      | Polling           |                    |
      | Insider           |                    |
      | Charts            |                    |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaProfile
  Scenario Outline: [iOS] [CompanyPage] User Access Company page via user profile
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "Livaldo"
    And User will redirect to profile "Livaldo"
    And User click "<section>" on profile stream menu
    And User find stream post that contains "STOCK_SYMBOL"
    And User click "STOCK_SYMBOL"
    Then User will redirect to "STOCK_SYMBOL" company page
      Examples:
        | section    |
        | Ideas      |
        | Replies    |
        | Charts     |
        | Prediction |
        | Polling    |
        | Liked      |
        | Saved      |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaCommentProfilePost @SIE
  Scenario Outline: [iOS] [CompanyPage] [IDC] [SIE] User access company page via comment on profile post
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "Livaldo"
    And User will redirect to profile "Livaldo"
    And User click "<section>" on profile stream menu
    And User find comment stream post that contains "STOCK_SYMBOL"
    And User click "STOCK_SYMBOL"
    Then User will redirect to "STOCK_SYMBOL" company page
    Examples:
      | section    |
      | Ideas      |
      | Replies    |
      | Charts     |
      | Prediction |
      | Polling    |
      | Liked      |
      | Saved      |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaNotification
    Scenario Outline: [iOS] [CompanyPage] [Manual] User access company page via notification
      Given User login using "TRADING" account
      And User click stream menu
      And User click notification icon
      And User click "<notification type>"
      And User find notification that contains "STOCK_SYMBOL"
      And User click notification that contains "STOCK_SYMBOL"
      Then User will redirect to the post
      And User click "STOCK_SYMBOL" on the post
      Then User will redirect to "STOCK_SYMBOL" company page
        Examples:
          | notification type |
          | Semua             |
          | Mention           |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaNotificationReport
    Scenario: [iOS] [IDC] [Manual] [CompanyPage]
      Given User login using "TRADING" account
      And User click watchlist menu
      And User icon "<reports>" on the top right watchlist
      Then User will redirect to Laporan page
      And User find report that contains "STOCK_SYMBOL"
      And User click on of the list that contains "STOCK_SYMBOL"
      And User will redirect to the post
      And User click "STOCK_SYMBOL" on the post
      Then User will see popup reports "STOCK_SYMBOL"
      And User click "STOCK_SYMBOL" on popup
      Then User will redirect to "STOCK_SYMBOL" company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaStreamCompanyPage
      Scenario Outline: [iOS] [Manual] [IDC] User Access Company page Via Stream Company Page
        Given User login using "Trading" account
        And User click search menu
        And User click search textbox
        And User input query "STOCK_SYMBOL"
        And User see Company "STOCK_SYMBOL" is displayed in the search result
        And User click company symbol "STOCK_SYMBOL"
        And User see "STOCK_SYMBOL" company page
        And User scroll to stream
        And User click "<section>" with "<selection>" option
        And User find stream with contain "STOCK_SYMBOL"
        And User click "STOCK_SYMBOL"
        Then User will redirect to "STOCK_SYMBOL" company page

        Examples:
          | section           | selection          |
          | All               |                    |
          | Berita            |                    |
          | Reports           | All                |
          | Reports           | Laporan Keuangan   |
          | Reports           | RUPS/Public Expose |
          | Reports           | Kepimilikan saham  |
          | Reports           | Dividend           |
          | Reports           | Corp. Action       |
          | Reports           | Lainnya            |
          | Research          |                    |
          | Ide               |                    |
          | Prediksi          |                    |
          | Polling           |                    |
          | Insider           |                    |
          | Charts            |                    |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaStreamCompanyPage
  Scenario Outline: [iOS] [Manual] [IDC] User Access Company page Via Stream Company Page
    Given User login using "Trading" account
    And User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User scroll to stream
    And User click "<section>" with "<selection>" option
    And User find comment with contain "STOCK_SYMBOL"
    And User click "STOCK_SYMBOL"
    Then User will redirect to "STOCK_SYMBOL" company page

    Examples:
      | section           | selection          |
      | All               |                    |
      | Berita            |                    |
      | Reports           | All                |
      | Reports           | Laporan Keuangan   |
      | Reports           | RUPS/Public Expose |
      | Reports           | Kepimilikan saham  |
      | Reports           | Dividend           |
      | Reports           | Corp. Action       |
      | Reports           | Lainnya            |
      | Research          |                    |
      | Ide               |                    |
      | Prediksi          |                    |
      | Polling           |                    |
      | Insider           |                    |
      | Charts            |                    |

  @CompanyPage @NotaAutomated @iOS @Positive @IDC @AccessCompanyPageViaTrendingSection @SIE
    Scenario: [iOS] [CompanyPage] User access company page via trending section
      Given User login using "Trading" account
      And User click search menu
      And User scroll until see Trending section
      And User click one of list trending stocks
      Then User will redirect to "STOCK_SYMBOL" company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaWatchlist
    Scenario: [iOS] [CompanyPage] User access company page via watchlist
      Given User login using "Trading" account
      And User click watchlist menu
      And User click icon plus (+)
      And User input "STOCK_SYMBOL" on search box
      And User click "STOCK_SYMBOL"
      And User back to watchlist menu
      And User click "STOCK_SYMBOL" in watchlist
      Then User will redirect to "STOCK_SYMBOL" company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaChat @SIE
    Scenario: [iOS] [CompanyPage] [Manual] User access company page via chat
      Given User login using "Trading" account
      And User click chat menu
      And User send chat in group with chat "STOCK_SYMBOL"
      And User success send chat
      And User click chat with "STOCK_SYMBOL" in list chat
      Then User will redirect to "STOCK_SYMBOL" company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaScreener
    Scenario: [iOS] [CompanyPage] [Manual] User access company page via screener
      Given User login using "Trading" account
      And User click search menu
      And User click screener entry point
      And User click one of list Preset Screener
      And User click one of preset list
      And User click one of "STOCK_SYMBOL" of the list
      Then User will redirect to "STOCK_SYMBOL" company page

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaHotList
    Scenario Outline: [iOS] [CompanyPage] [Manual] User access company page via hot list
      Given User login using "Trading" account
      And User click search menu
      And User scroll to ranking section
      And User click one of "STOCK_SYMBOL" on hot list "<category>"
      Then User will redirect to "STOCK_SYMBOL" company page
        Examples:
          | category    |
          | Most active |
          | Top Gainer  |
          | Top Loser   |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @AccessCompanyPageViaSector
      Scenario Outline: [iOS] [Manual] [CompanyPage] User access company page via sector
        Given User login using "Trading" account
        And User click search menu
        And user scroll to "<sector>" section
        And User click sector menu
        And User will redirect to the selected sector page
        And User click one "STOCK_SYMBOL" in the list sub sector
        Then User will redirect to "STOCK_SYMBOL" company page
          Examples:
            | sector        |
            | BASIC-IND     |
            | FINANCE       |
            | CYLICAL       |
            | ENERGY        |
            | PROPERTY      |
            | INFRASTRUCTURE|
            | INDUSTRIAL    |
            | NON-CYCLICAL  |
            | TRANSPORT     |
            | TECHNOLOGY    |
            | HEALTH        |

  @CompanyPage @NotAutomated @iOS @IDC @Positive @AccessCompanyPageViaRanking
    Scenario Outline: [iOS] [Manual] [CompanyPage] access company page via ranking
      Given User login using "Trading" account
      And User click search menu
      And User scroll to "<index>" section
      And User click see more in index section
      And User click one of "index" list
      And User will redirect to the selected index list
      And User click one of "STOCK_SYMBOL" on the index list
      Then User will redirect to "STOCK_SYMBOL" company page
        Examples:
          | index     |
          | IDXBUMN20 |
          | SMinfra18 |
          | IDXSMC-LIQ|
          | INFOBANK15|
          | IDXG30    |
          | BISNIS-27 |
          | MNC36     |
          | IDXMESBUMN|
          | IDXSMC-COM|
          | DBX       |
          | MBX       |
          | Investor33|
          | IDXQ30    |
          | I-GRADE   |
          | IDXV30    |
          | PRIMBANK10|
          | ESGQKEHATI|
          | PEFINDO25 |
          | KOMPAS100 |
          | IDX80     |
          | ESGSKEHATI|
          | IDXESGL   |
          | ABX       |
          | IDXSHAGROW|
          | JII70     |
          | IDXLQ45LCL|

 @CompanyPage @NotAutomated @iOS @IDC @AccessCompanyPageViaRealPortofolio
   Scenario: [iOS] [Manual] [IDC] User access company page via real portofolio
    Given User login using "Trading" account
    And User click portfolio menu
    And User input trading pin "Trading"
    And User will redirect to Real Portofolio page
    And User click one of the list stock in portofolio page
    And User click "STOCK_SYMBOL" on the top of portofolio detail
    Then User will redirect to "STOCK_SYMBOL" company page

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

  @CompanyPage @NotAutomated @iOS @Positive @IDC @PEBand @PBVBand @UserSwitchPriceEarnings
    Scenario Outline: [iOS] [CompapnyPage] [Manual] User explore price earnings in analysis
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "ANALYSIS" in company page
    And User click "<PE ratio>", "<period>" section
    Then User see result price earning data
      Examples:
        | PE ratio        | period   |
        | PE Band(TTM)    | 3 tahun  |
        | PE Band(TTM)    | 5 tahun  |
        | PE Band(TTM)    | 10 tahun |
        | Forward PE Band | 3 tahun  |
        | Forward PE Band | 5 tahun  |
        | Forward PE Band | 10 tahun |

  @CompanyPage @NotAutomated @iOS @Positive @IDC @PEBand @PBVBand @UserExplorePBV
  Scenario Outline: [iOS] [CompapnyPage] [Manual] User explore PBV in analysis
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "ANALYSIS" in company page
    And User click "<pbv>", "<period>" section
    Then User see result pbv data
    Examples:
      | pbv    | period   |
      | pbv    | 3 tahun  |
      | pbv    | 5 tahun  |
      | pbv    | 10 tahun |

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

  @CompanyPage @NotAutomated @iOS @Positive @IDC @Perbandingan
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

  @CompanyPage @NotAutomated @iOS @Positive @IDC @CorpAction
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

  @CompanyPage @NotAutomated @iOS @Positive @IDC @CorpAction
  Scenario Outline: [iOS] [CompanyPage] User access tab menu Corp Action In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "CORP ACTION" in company page
    Then User click "CORP ACTION" in company page
    And User click "<corp action menu>" on corp action
    Then User see corp action menu to the selected tab
      Examples:
        | corp action menu |
        | Semua            |
        | Dividen          |
        | Stock Split      |
        | Reverse Split    |
        | Right Issue      |
        | Warrant          |
        | Bonus            |
        | Tender Offer     |
        | RUPS             |

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
  Scenario: [iOS] [CompanyPage] User See Profile In Company Page
    Given User login using "Trading" account
    When User click search menu
    And User click search textbox
    And User input query "STOCK_SYMBOL"
    And User see Company "STOCK_SYMBOL" is displayed in the search result
    And User click company symbol "STOCK_SYMBOL"
    And User see "STOCK_SYMBOL" company page
    And User see "PROFIL" insider page
    Then User click "PROFILE" in company page

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
    And User change "<investor type>", "<date>"
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