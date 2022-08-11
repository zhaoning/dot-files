(setq org-agenda-compact-blocks t)
(setq org-agenda-tags-todo-honor-ignore-options t)

(setq org-agenda-custom-commands
      '(("n" "Master view"
	 ((agenda "")
	  (tags "REFILE"
		((org-agenda-overriding-header "Tasks to Refile")
		 (org-tags-match-list-sublevels nil)))
	  (tags-todo "/!NEXT"
		     ((org-agenda-overriding-header "Next Tasks")
		      (org-agenda-todo-ignore-scheduled 'all)
		      (org-agenda-todo-ignore-deadlines nil)
		      (org-agenda-todo-ignore-with-date nil)
		      (org-agenda-sorting-strategy
		       '(priority-down effort-up category-keep))))
	  (stuck ""
		 ((org-agenda-overriding-header "Stuck Projects")))
	  (todo "HOLD|WAITING"
		((org-agenda-overriding-header "On Hold or Waiting")))
	  (tags "IDEA"
		((org-agenda-overriding-header "Ideas")
		 (org-tags-match-list-sublevels nil)))
	  (todo "TODO"
		((org-agenda-overriding-header "Backlog")
		 (org-agenda-todo-ignore-scheduled 'all)
		 (org-agenda-todo-ignore-deadlines 'all)
		 (org-agenda-todo-ignore-with-date 'all)
		 (org-agenda-sorting-strategy
		  '(priority-down effort-up category-keep)))))
	 ((org-agenda-tag-filter-preset '("-homework"))))
	("h" "Homework" agenda ""
	 ((org-agenda-tag-filter-preset '("+homework"))))))
