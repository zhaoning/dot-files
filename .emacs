(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ledger-reconcile-sort-key "(date)")
 '(ledger-reports
   '(("Upcoming Payables" "%(binary) -f %(ledger-file) reg ^Asset:Receivable --effective -b \"today\" -S \"date\"")
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
 '(ledger-schedule-file "schedule.ledger")
 '(org-agenda-custom-commands
   '(("n" "Agenda and all TODOs"
      ((agenda "" nil)
       (alltodo ""
		((org-agenda-todo-ignore-scheduled 'all)
		 (org-agenda-todo-ignore-deadlines 'all))))
      nil)
     ("b" "Backlog" alltodo ""
      ((org-agenda-todo-ignore-scheduled 'all)
       (org-agenda-todo-ignore-deadlines 'all)))
     ("i" "Individual agenda" agenda ""
      ((org-agenda-tag-filter-preset
	'("-homework"))))
     ("l" "Luke agenda" agenda ""
      ((org-agenda-tag-filter-preset
	'("+homework"))))))
 '(org-agenda-files (file-expand-wildcards "~/org/*.org"))
 '(org-capture-templates
   '(("t" "Task" entry
      (file "~/org/inbox.org")
      "* TODO %^{Task}%? %^G\n  %u" :empty-lines 1)
     ("g" "Grocery" entry
      (file "~/org/inbox.org")
      "* TODO %?  :grocery:\n  %u" :empty-lines 1)
     ("b" "Building" entry
      (file+olp "~/org/finance.org" "Property" "Craigieburn" "DIY house repair" "Tools and materials")
      "* TODO %?  :building:bunnings:\n  %u" :empty-lines 1)))
 '(org-tag-persistent-alist
   '((:startgroup)
     ("home" . 104)
     ("office")
     ("errand")
     (:endgroup)
     (:newline)
     (:startgrouptag)
     ("errand")
     (:grouptags)
     ("grocery" . 103)
     ("chemist" . 99)
     ("library")
     ("mall")
     (:endgrouptag)
     (:newline)
     ("rhodes")
     ("chatswood")
     ("sydney")
     (:newline)
     ("research" . 114)
     ("minutes" . 109)
     ("hours" . 111)))
 '(package-selected-packages '(magit ledger-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(load-theme 'tango-dark t)

(setq org-deadline-warning-days 3)

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)

(setq org-adapt-indentation t)

(setq org-default-notes-file (quote "~/org/inbox.org"))

(setq column-number-mode t)

