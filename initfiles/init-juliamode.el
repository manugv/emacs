;;;========================================
;;; Using vterm istead of the regular emacs terminal gives us all
;;; the power of Julia repl, including colors, completion, etc. Git
;;; Required: cmake, libtool
;;;========================================

(use-package vterm
    :ensure t)

;; (use-package julia-snail
;;   :ensure t
;;   :hook (julia-mode . julia-snail-mode))


;; Julia REPL configuration
(use-package julia-repl
  :ensure t
  :config
  ;; Set the terminal backend
  (setq julia-repl-set-terminal-backend 'vterm))

(use-package eglot-jl
  :ensure t
  :init
  (eglot-jl-init))

;; Julia mode
(use-package julia-mode
  :mode "\\.jl\\'"
  :init (setenv "JULIA_NUM_THREADS" "4")  
  :hook((julia-mode . julia-repl-mode)
	(julia-mode . eglot-ensure)
	))

(provide 'init-juliamode)
