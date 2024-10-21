;;;========================================
;;; Python
;;;========================================
 
(use-package python
  :config
  ;; Python interactive shells
  ;; (setq python-shell-interpreter "ipython"
  ;;  	 python-shell-interpreter-args "--simple-prompt")
  :hook
  (python-mode . hs-minor-mode))
 

;; numpy docstring for python
(use-package numpydoc
  :ensure t
  :after python
  ;; :config  (setq numpydoc-insertion-style 'nil)
  :bind (:map python-mode-map
	      ("C-c C-n" . numpydoc-generate)))

;; Open  in tree sitter mode
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; language servers to use
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;; 	       '((python-mode python-ts-mode) . ("basedpyright-langserver" "--stdio"))))

;; ruff server
;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '((python-mode python-ts-mode) . ("ruff" "server"))))
;;  (add-hook 'after-save-hook 'eglot-format))


;; flymake ruff as eglot doesn't support multiple servers
;; (use-package flymake-ruff
;;   :ensure t
;;   :hook (eglot-managed-mode . flymake-ruff-load))


;; Automatically start eglot
(add-hook 'python-ts-mode-hook 'eglot-ensure)


(provide 'init-python)
