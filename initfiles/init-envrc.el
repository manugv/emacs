;; Manage enviornments using direnv
;; install direnv on desktop
(use-package envrc
  :if (executable-find "direnv")        ; Only load envrc if direnv is installed
  :ensure t
  :hook (after-init . envrc-global-mode)
  ;; (prog-mode . envrc-mode)
  )

(provide 'init-envrc)
