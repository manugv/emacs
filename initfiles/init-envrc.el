;; Manage enviornments using direnv
;; install direnv on desktop
(use-package envrc
  :ensure t
  :hook (prog-mode . envrc-mode))

(provide 'init-envrc)
