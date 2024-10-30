;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents   . 5)
			  (projects  . 5) 
                          (agenda    . 5)))
  ;; (setq dashboard-startupify-list '(dashboard-insert-banner-title
  ;;                                   dashboard-insert-navigator
  ;;                                   '(dashboard-insert-newline 2)
  ;;                                   dashboard-insert-footer))
  (setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
  (setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
  (setq dashboard-set-file-icons t)
  ;;(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
  (setq dashboard-match-agenda-entry "TODO=\"TODO\"")
  (setq dashboard-agenda-sort-strategy '(time-up)))

(provide 'init-startscreen)
