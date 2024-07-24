;; use magit

(use-package magit
  :ensure t
  :config
  :bind (("C-x g" . magit-status)
         ("C-c M-g" . magit-file-popup)))

(provide 'init-git)
