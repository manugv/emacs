;; Load a theme
;;; For the built-in themes which cannot use `require'.
(use-package modus-themes
  :ensure t
  :demand t
  :bind (("<f5>" . modus-themes-toggle)
	 ("C-<f5>" . modus-themes-select))
  :config
  (setq modus-themes-to-toggle '(modus-vivendi-tinted modus-operandi-tinted)
	modus-themes-mixed-fonts t)
  ;; Load the theme of your choice.
  (load-theme 'modus-vivendi-tinted :no-confirm))


;; fixed-pitch will be same as default.
(set-face-attribute 'default nil
		    :family "Fira Code"
		    :height 130
		    :weight 'regular
		    )
(set-face-attribute 'variable-pitch nil
 		    :family "JetBrainsMono"
		    :height 130
		    :weight 'Regular)

;; make the text mode to use variable pitch
(add-hook 'text-mode-hook #'variable-pitch-mode)

(provide 'init-look)
