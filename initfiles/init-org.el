(use-package org
  :config 
  ;; remove emphasis 
  (setq org-hide-emphasis-markers t)
  ;; Org syntax highlighting
  (setq org-src-fontify-natively t)
  (setq org-log-done 'time)
  )

(use-package org-contrib
  :ensure t)
  
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (ledger . t)
   (emacs-lisp . t)
   (julia . t)
   (latex . t)
   (shell . t)
   ))

;; org files
;;(setq org-agenda-files '("~/Documents/Org"))
(if (equal system-name "sunflower")
    (setq org-agenda-files  '("~/Documents/Org/TODO")))
  ;; (setq org-agenda-files  (directory-files-recursively "~/Org/TODO" "\\.org$")))
(if (equal system-name "jasmine")
    (setq org-agenda-files  (directory-files-recursively "~/Documents/git/Org/TODO/" "\\.org$")))
(if (equal system-name "VITO")
    (setq org-agenda-files  '("~/Documents/Org")))


;; wrap words making a fixed width of column
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)
;; variable fonts
(add-hook 'org-mode-hook 'variable-pitch-mode)

(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-to-list 'org-modules 'org-habit t) ;; load org habits
  )


;; prettifying org mode.
(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

 
(provide 'init-org)
