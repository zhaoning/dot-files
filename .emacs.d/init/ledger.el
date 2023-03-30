(setq ledger-reconcile-sort-key "(date)")

(setq ledger-schedule-file "schedule.ledger")

(setq ledger-copy-transaction-insert-blank-line-after t)

(setq ledger-reports
      '(;; RECONCILIATION
        ("rga - Register of Account"
	 "%(binary) -f ~/ledger/ktulu.ledger reg %(account) -c")
        ("rgp - Register of Payee"
	 "%(binary) -f ~/ledger/ktulu.ledger reg @%(payee) -c")
	("pe - Pending"
	 "%(binary) -f ~/ledger/ktulu.ledger reg --pending")
	;; SUPER RECONCILIATION
	("suc - Super Contributions"
	 "%(binary) -f ~/ledger/ktulu.ledger reg -b 2021-07-01 -e 2022-07-01 ^Asset:Super:Virgin and @AIAA")
	("suf - Super Administration & Investment Fees"
	 "%(binary) -f ~/ledger/ktulu.ledger reg -b 2021-07-01 -e 2022-07-01 ^Expense:Finance and @\"Virgin Money Super\" and \"expr\" \"note =~ /fee/\"")
	("sup - Super Insurance Premiums"
	 "%(binary) -f ~/ledger/ktulu.ledger reg -b 2021-07-01 -e 2022-07-01 ^Expense:Misc:Insurance and @\"Virgin Money Super\"")
	("sut - Super Contribution Tax and Adjustments"
	 "%(binary) -f ~/ledger/ktulu.ledger reg -b 2021-07-01 -e 2022-07-01 ^Expense:Finance and @\"Virgin Money Super\" and \"expr\" \"note =~ /tax/\" ^Expense:Tax:Contribution")
	("sub - Super Balance"
	 "%(binary) -f ~/ledger/ktulu.ledger bal -e 2022-07-01 -X AUD")
	;; EXECUTION
	("up - Upcoming Payables"
	 "%(binary) -f ~/ledger/ktulu.ledger reg ^Liability:Payable --effective -d \"d>=today\" -S \"date\"")
	("ura - Upcoming Register of Account"
	 "%(binary) -f ~/ledger/ktulu.ledger reg %(account) -d \"d>=today\"")
	;; BUDGETING
	("bb - Budget Balance"
	 "%(binary) -f ~/ledger/ktulu.ledger bal --budget --effective")
        ("era - Effective Register of Account"
	 "%(binary) -f ~/ledger/ktulu.ledger reg %(account) --effective --period 'last 12 months' -M")
        ("erp - Effective Register of Payee"
	 "%(binary) -f ~/ledger/ktulu.ledger reg @%(payee) --effective --period 'last 12 months' -M")
	;; FORECASTING
	;;
	;; TAX
	;;
	;; PROGRESSION
        ("nw - Net Worth"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Asset ^Liability -cnX AUD")
        ("bs3 - Balance Sheet D3"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Asset ^Liability -c --no-total --depth 3")
        ("bsx - Balance Sheet AUD"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Asset ^Liability -c -X AUD")
        ("in22x - Income FY22 AUD"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Income -b 2021-07-01 -e 2022-07-01 -X AUD")
        ("ex22x - Expense FY22"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Expense -b 2021-07-01 -e 2022-07-01 -X AUD")
        ("pl22x - Profit Loss FY22"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Income ^Expense -b 2021-07-01 -e 2022-07-01 -X AUD")
	;; INVESTMENT
        ("aa22x - Investment Allocation FY22"
	 "%(binary) -f ~/ledger/ktulu.ledger bal ^Asset:Crypto ^Asset:Security ^Asset:Property -e 2022-06-30 -X AUD")
	;; INFORMATION
        ("acl - Account List"
	 "%(binary) -f ~/ledger/ktulu.ledger accounts")
	("pyl - Payee List"
	 "%(binary) -f ~/ledger/ktulu.ledger payees")
	("pyr - Payee Ranking"
	 "%(binary) -f ~/ledger/ktulu.ledger reg -P -S T")
	("pyd - Payee Dining"
	 "%(binary) -f ~/ledger/ktulu.ledger reg ^Expense:Dining\\ Out -P -S T")
	("pyg - Payee Groceries"
	 "%(binary) -f ~/ledger/ktulu.ledger reg ^Expense:Groceries -P -S T")
	;; OPEN
	("rg - Register"
	 "%(binary) -f ~/ledger/ktulu.ledger reg Asset:Receivable:Yan\\ Sun -c -F \"%D %-.25P %15t %-30N\\n\" -b 2022-09-11")
	;; UNSORTED
	))
