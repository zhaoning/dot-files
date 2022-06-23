(put 'narrow-to-region 'disabled nil)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
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
	'("-luke"))))
     ("l" "Luke agenda" agenda ""
      ((org-agenda-tag-filter-preset
	'("+luke"))))))
 '(org-agenda-files (file-expand-wildcards "~/org/*.org"))
 '(org-capture-templates
   '(("t" "Task" entry
      (file+headline "~/org/inbox.org" "Tasks")
      "* TODO %^{Task}%? %^G
  %u" :empty-lines 1)
     ("i" "Idea" entry
      (file "~/org/inbox.org")
      "" :empty-lines 1)
     ("g" "Grocery" entry
      (file+olp "~/org/trivia.org" "Shopping")
      "* TODO %?  :grocery:
  %u" :empty-lines 1))))

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

