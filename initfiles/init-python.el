;;;========================================
;;; Python
;;;========================================
 
(use-package python
  :config
  (setq python-indent-offset 4)
  ;; Python interactive shells
   (setq python-shell-interpreter "ipython"
    	 python-shell-interpreter-args "--simple-prompt")
   (setq-default eglot-workspace-configuration
		 '((:pylsp . (:configurationSources ["flake8"]
			      :plugins (:flake8 (:enabled :json-false)
					:black (:enabled :json-false :line_length 100 :cache_config t)
					:mccabe (:enabled t  :threshold 15)
					:pyflakes (:enabled :json-false)
					:yapf (:enabled :json-false)
					:pydocstyle (:enabled :json-false :convention "numpy")
					:rope (:enabled :json-false)
					:ruff (:enabled t :lineLength 100)
					:pycodestyle (:enabled :json-false)
					:autopep8 (:enabled :json-false))))))
   :hook
   (python-mode . hs-minor-mode)
   )

;; numpy docstring for python
(use-package numpydoc
  :ensure t
  :after python
  ;; :config  (setq numpydoc-insertion-style 'nil)
  :bind (:map python-mode-map
	      ("C-c C-n" . numpydoc-generate)))

;; Open  in tree sitter mode
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))
(add-hook 'python-ts-mode-hook 'eglot-ensure)

(provide 'init-python)
