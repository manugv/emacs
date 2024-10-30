;;;========================================
;;; eglot
;;;========================================

(use-package eglot
  :defer t
  :init
  ;; https://github.com/minad/corfu/wiki
  (setq completion-category-overrides '((eglot (styles orderless))
					(eglot-capf (styles orderless))))
  :bind (:map eglot-mode-map
              ("C-c h" . eldoc)
              ("C-c r" . eglot-rename)
	      ("C-c o" . eglot-code-actions)
              ("C-c C-f" . eglot-format-buffer)))


(provide 'init-eglot)
