(setq ledger-reconcile-sort-key "(date)")

(setq ledger-schedule-file "schedule.ledger")

(setq ledger-reports
      '(;; RECONCILIATION
        ("rga - Register of Account"
	 "%(binary) -f %(ledger-file) reg %(account) -c")
        ("rgp - Register of Payee"
	 "%(binary) -f %(ledger-file) reg @%(payee) -c")
	("pe - Pending"
	 "%(binary) -f %(ledger-file) reg --pending")
	;; EXECUTION
	("up - Upcoming Payables"
	 "%(binary) -f %(ledger-file) reg ^Liability:Payable --effective -b \"today\" -S \"date\"")
	;; BUDGETING
	("bb - Budget Balance"
	 "%(binary) -f %(ledger-file) bal --budget --effective")
        ("era - Effective Register of Account"
	 "%(binary) -f %(ledger-file) reg %(account) --effective --period 'last 12 months' -M")
        ("erp - Effective Register of Payee"
	 "%(binary) -f %(ledger-file) reg @%(payee) --effective --period 'last 12 months' -M")
	;; FORECASTING
	;;
	;; TAX
	;;
	;; PROGRESSION
        ("nw - Net Worth"
	 "%(binary) -f %(ledger-file) bal ^Asset ^Liability -cnX AUD")
        ("bs3 - Balance Sheet D3"
	 "%(binary) -f %(ledger-file) bal ^Asset ^Liability -c --no-total --depth 3")
        ("bsx - Balance Sheet AUD"
	 "%(binary) -f %(ledger-file) bal ^Asset ^Liability -c -X AUD")
        ("in22x - Income FY22 AUD"
	 "%(binary) -f %(ledger-file) bal ^Income -b 2021-07-01 -e 2022-07-01 -X AUD")
        ("ex22x - Expense FY22"
	 "%(binary) -f %(ledger-file) bal ^Expense -b 2021-07-01 -e 2022-07-01 -X AUD")
        ("pl22x - Profit Loss FY22"
	 "%(binary) -f %(ledger-file) bal ^Income ^Expense -b 2021-07-01 -e 2022-07-01 -X AUD")
	;; INVESTMENT
        ("aa22x - Investment Allocation FY22"
	 "%(binary) -f %(ledger-file) bal ^Asset:Crypto ^Asset:Security ^Asset:Property -e 2022-06-30 -X AUD")
	;; INFORMATION
        ("acl - Account List"
	 "%(binary) -f %(ledger-file) accounts")
	("pyl - Payee List"
	 "%(binary) -f %(ledger-file) payees")
	("pyr - Payee Ranking"
	 "%(binary) -f %(ledger-file) reg -P -S T")
	("pyd - Payee Dining"
	 "%(binary) -f %(ledger-file) reg ^Expense:Dining\\ Out -P -S T")
	("pyg - Payee Groceries"
	 "%(binary) -f %(ledger-file) reg ^Expense:Groceries -P -S T")
	;; OPEN
	("rg - Register"
	 "%(binary) -f %(ledger-file) reg Asset:Receivable:Yan\\ Sun -c -F \"%D %-.25P %15t %-30N\\n\" -b 2022-09-11")
	;; UNSORTED
	))
