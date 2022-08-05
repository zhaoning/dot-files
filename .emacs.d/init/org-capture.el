(setq org-capture-templates
      (quote (("t" "Task" entry (file "~/org/inbox.org")
               "* TODO %?\n  %U\n  %a\n")
              ("r" "Respond" entry (file "~/org/inbox.org")
               "* NEXT Respond to %^{from} on %^{subject}\n  SCHEDULED: %t\n  %U\n  %a\n"
	       :immediate-finish t)
              ("n" "note" entry (file "~/org/inbox.org")
               "* %? :NOTE:\n  %U\n  %a\n")
              ("j" "Journal" entry (file+datetree "~/org/diary.org")
               "* %?\n  %U\n")
              ("i" "Idea" entry (file "~/org/inbox.org")
               "* %? :IDEA:\n  %U\n")
              ("m" "Meeting" entry (file "~/org/inbox.org")
               "* MEETING %? :MEETING:\n  %U\n"
	       :clock-in t :clock-resume t)
              ("p" "Phone" entry (file "~/org/inbox.org")
               "* PHONE %? :PHONE:\n  %U\n"
	       :clock-in t :clock-resume t)
	      ("g" "Grocery" entry (file "~/org/inbox.org")
	       "* TODO %? :grocery:\n  %U\n")
              )))
