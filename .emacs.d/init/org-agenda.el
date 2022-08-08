(setq org-agenda-compact-blocks t)

(setq org-agenda-custom-commands
      '(("n" "Master view"
	 ((agenda "" nil)
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
	  (stuck "" nil
		 ((org-agenda-overriding-header "Stuck Projects")))
	 nil))))
