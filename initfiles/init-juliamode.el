;;;========================================
;;; Using vterm istead of the regular emacs terminal gives us all
;;; the power of Julia repl, including colors, completion, etc. Git
;;; Required: cmake, libtool
;;;========================================

(use-package vterm
    :ensure t)

;; Julia REPL configuration
(use-package julia-repl
  :ensure t
  :config
  ;; Set the terminal backend
  (setq julia-repl-set-terminal-backend 'vterm)
   ;; Keybindings for quickly sending code to the REPL
  :bind (:map julia-repl-mode-map
	      ("<C-RET>" . 'my/julia-repl-send-cell)
 	      ("<M-RET>" . 'julia-repl-send-line)
 	      ("<S-return>" . 'julia-repl-send-buffer)
	      ))

;; Julia mode
(use-package julia-mode
  :ensure t
  :mode "\\.jl\\'"
  :interpreter ("julia" . julia-mode)
  :init (setenv "JULIA_NUM_THREADS" "4")  
  :hook(	(julia-mode . julia-repl-mode)
		(julia-mode . eglot-ensure)
	))

(use-package eglot-jl
  :ensure t
  :init
  (eglot-jl-init)
  (setq eglot-jl-default-environment "~/.julia/environments/v1.10")
  (setq eglot-jl-julia-command "~/.juliaup/bin/julia"))


(provide 'init-juliamode)
