(setq org-capture-templates
  '(("t" "Task" entry (file "~/org/inbox.org")
     "* TODO %?\n%u\n%a\n")
    ("r" "Respond" entry (file "~/org/inbox.org")
     "* NEXT Respond to %^{from} on %^{subject}\nSCHEDULED: %t\n%u\n%a\n"
     :immediate-finish t)
    ("n" "Note" entry (file "~/org/inbox.org")
     "* %? :NOTE:\n%u\n%a\n")
    ("j" "Journal" entry (file+datetree "~/org/diary.org")
     "* %?\n%u\n")
    ("i" "Idea" entry (file "~/org/inbox.org")
     "* %? :IDEA:\n%u\n")
    ("m" "Meeting" entry (file "~/org/inbox.org")
     "* MEETING %? :MEETING:\n%u\n"
     :clock-in t :clock-resume t)
    ("p" "Phone" entry (file "~/org/inbox.org")
     "* PHONE %? :PHONE:\n%u\n"
     :clock-in t :clock-resume t)
    ("g" "Grocery" entry (file+olp "~/org/trivia.org" "Shopping")
     "* TODO %? :grocery:\n%u\n")
    ))
