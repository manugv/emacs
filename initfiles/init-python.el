;;;========================================
;;; eglot
;;;========================================

(use-package eglot
  :defer t
  :bind (:map eglot-mode-map
              ("C-c h" . eldoc)
              ("C-c C-e" . eglot-rename)
              ("C-c C-f" . eglot-format-buffer))
  :hook ((python-ts-mode . eglot-ensure)))

;;;========================================
;;; Python
;;;========================================
;; (use-package pyvenv
;;   :ensure t
;;   :config
;;   (pyvenv-activate "/home/manugv/pythonenv/base/"))

;; numpy docstring for python
(use-package numpydoc
  :ensure t
  :after python
  :config  (setq numpydoc-insertion-style 'yas)
  :bind (:map python-ts-mode-map
	      ("C-c C-n" . numpydoc-generate)))


(use-package python
  :config
  (setq python-indent-offset 4)
   ;;Python interactive shells
   (setq python-shell-interpreter "ipython"
    	 python-shell-interpreter-args "--simple-prompt")
   :hook
   ((python-mode . pyvenv-mode)
    (python-mode . hs-minor-mode)
    (python-mode . eglot-ensure)
    (python-mode . (lambda () (set-fill-column 120))))
   :config
   (setq-default eglot-workspace-configuration
		 '((:pylsp . (:configurationSources ["flake8"]
	     		      :plugins (
				:pycodestyle (:enabled :json-false)
				:flake8 (:enabled :json-false :maxLineLength 120)
				:black (:enabled :json-false :line_length 100 :cache_config t)
				:mccabe (:enabled t  :threshold 15)
				:pyflakes (:enabled :json-false)
				:ruff (:enabled t);; :lineLength 100)
				:yapf (:enabled t)
				:pydocstyle (:enabled :json-false :convention "numpy")
				:rope (:enabled :json-false)
				:autopep8 (:enabled :json-false))))))
   )
;; Open  in tree sitter mode
(add-to-list 'major-mode-remap-alist '(python-mode . python-ts-mode))

;; (with-eval-after-load 'eglot
;;   (add-to-list 'eglot-server-programs
;;                '(python-ts-mode . ("ruff" "server" "--preview"))))

(provide 'init-python)
