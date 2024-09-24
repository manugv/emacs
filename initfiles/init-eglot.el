;;;========================================
;;; eglot
;;;========================================


(use-package eglot
  :defer t
  :init
  ;; https://github.com/minad/corfu/wiki
  ;; (setq completion-category-overrides '((eglot (styles orderless))
  ;; 					(eglot-capf (styles orderless)))
  
  ;; :config
  ;; (add-to-list 'eglot-server-programs
  ;; 	       '((python-mode python-ts-mode) . ("pyright-langserver" "--stdio")))

  :bind (:map eglot-mode-map
              ;; ("C-c C-d" . eldoc)
              ("C-c C-e" . eglot-rename)
              ("C-c C-f" . eglot-format-buffer)))

(add-hook 'prog-mode-hook #'eglot-ensure)

;; make eldoc to show in a line in minibuffer
;; (setq eldoc-echo-area-use-multiline-p nil)

;; to show eldoc output, needs work
(use-package eldoc-box
  :ensure t)
(global-set-key (kbd "C-h D") #'eldoc-box-help-at-point)

(provide 'init-eglot)
