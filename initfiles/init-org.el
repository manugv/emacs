
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (julia . t)
   (latex . t)
   (shell . t)
   ))

;; org files
;;(setq org-agenda-files '("~/Documents/Org"))
(if (equal system-name "sunflower")
    (setq org-agenda-files  (directory-files-recursively "~/Documents/Org/TODO" "\\.org$")))

;; Org syntax highlighting
(setq org-src-fontify-natively t)
(add-hook 'text-mode-hook 'turn-on-visual-line-mode)

(with-eval-after-load 'org       
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  )

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))


;; (use-package org-modern
;;   :ensure t)

;; (add-hook 'org-mode-hook 'org-modern-mode)
;; (add-hook 'org-agenda-finalize-hook 'org-modern-agenda)
;; (with-eval-after-load 'org (global-org-modern-mode))

(provide 'init-org)
