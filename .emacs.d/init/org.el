(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(setq org-agenda-files (quote ("~/org")))
(setq org-default-notes-file (quote "~/org/inbox.org"))

(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "|" "DONE(d)")
        (sequence "WAITING(w@/!)" "HOLD(h@/!)" "|" "CANCELLED(c@/!)" "PHONE(p)" "MEETING(m)")))

(setq org-tag-persistent-alist
      '((:startgroup) ("IDEA" . ?I) ("PROJECT" . ?P) ("AREA" . ?A) ("NOTE" . ?N) (:endgroup) (:newline)
	(:startgroup) ("home" . ?h) ("office" . ?o) ("errand" . ?e) (:endgroup) (:newline)
	("term" . ?t) ("mac" . ?m) ("tablet" . ?b) ("phone" . ?p) (:newline)
	(:startgrouptag) ("grocery" . ?g) (:grouptags)
	("woolworths" . ?w) ("coles" . ?c) ("asian" . ?a)
	(:endgrouptag)))

(setq org-tags-exclude-from-inheritance '("PROJECT" "AREA"))
(setq org-stuck-projects '("PROJECT/-DONE-CANCELLED" ("NEXT") nil ""))

(setq org-refile-targets '((org-agenda-files :maxlevel . 3)))
(setq org-refile-use-outline-path 'file)

(setq org-adapt-indentation nil)
(setq org-agenda-span 'day)
(setq org-deadline-warning-days 3)
(setq org-archive-location "archive::")
