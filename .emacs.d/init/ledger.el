(setq ledger-reconcile-sort-key "(date)")

(setq ledger-schedule-file "schedule.ledger")

(setq ledger-reports
      '(("Upcoming Payables" "%(binary) -f %(ledger-file) reg ^Liability:Payable --effective -b \"today\" -S \"date\"")
        ("Net Worth" "%(binary) -f %(ledger-file) bal -cnX AUD ^Asset ^Liability")
        ("Monthly Trend Effective" "%(binary) -f %(ledger-file) --period 'last 12 months' -M --effective reg %(account)")
        ("FY22 Investment Activity Summary - Swyftx" "%(binary) -f %(ledger-file) -b 2021-07-01 -e 2022-07-01 reg ^Asset:Crypto:Swyftx:Current -P")
        ("FY22 Investment Activity Summary - IG" "%(binary) -f %(ledger-file) -b 2021-07-01 -e 2022-07-01 reg ^Asset:Security:IG:Current -P")
        ("FY22 Investment Allocation" "%(binary) -f %(ledger-file) -e 2022-06-30 bal --no-total ^Asset:Crypto ^Asset:Security ^Asset:Property -X AUD")
        ("FY22 Income" "%(binary) -f %(ledger-file) -b 2021-07-01 -e 2022-07-01 bal ^Income -X AUD")
        ("Balance Sheet" "%(binary) -f %(ledger-file) bal --flat --no-total -c ^Asset ^Liability")
        ("Register of Payee" "%(binary) -f %(ledger-file) reg -c @%(payee)")
        ("Register of Account" "%(binary) -f %(ledger-file) reg -c %(account)")
        ("Account List" "%(binary) -f %(ledger-file) accounts")
        ("FY22 Expense" "%(binary) -f %(ledger-file) -b 2021-07-01 -e 2022-07-01 bal ^Expense -X AUD")))
