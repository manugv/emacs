;; Load a theme
;;; For the built-in themes which cannot use `require'.
(use-package modus-themes
  :ensure t
  :config
  (setq modus-themes-to-toggle '(modus-vivendi-tinted modus-operandi-tinted)
	modus-themes-mixed-fonts t)
  
  ;; Load the theme of your choice.
  (load-theme 'modus-vivendi-tinted :no-confirm)
  (define-key global-map (kbd "<f5>") #'modus-themes-toggle))
  
;; (require-theme 'modus-themes)
;; Add all your customizations prior to loading the themes.
;; (setq modus-themes-bold-constructs t
;;       modus-themes-completions '((matches . (extrabold intense background))
;;                                  (selection . (semibold accented intense))
;;                                  (popup . (accented)))
;;       modus-themes-diffs 'desaturated
;;       modus-themes-headings '((1 . (1.2))
;;                               (2 . (rainbow 1.1))
;;                               (3 . (1))
;;                               (t . (monochrome)))
;;       modus-themes-hl-line '(nil)
;;       modus-themes-links '(nil)
;;       ;; can use mixed fonts
;;       modus-themes-mixed-fonts t
;;       modus-themes-mode-line '(borderless accented)
;;       modus-themes-prompts '(background)
;;       modus-themes-region '(accented bg-only)
;;       modus-themes-syntax '(faint)
;;       modus-themes-tabs-accented nil
;;       )
;; (setq modus-themes-org-agenda
;;       '((header-date . (grayscale workaholic bold-today))
;;         (header-block . (1.4 semibold))
;;         (scheduled . uniform)
;;         (event . (italic))
;;         (habit . traffic-light)))

;; Load the theme of your choice.
;; (load-theme 'modus-vivendi)
;; Optionally define a key to switch between Modus themes.  Also check
;; the user option `modus-themes-to-toggle'.
;; (define-key global-map (kbd "<f5>") #'modus-themes-toggle)


(set-face-attribute 'default nil
		    :family "Fira Code Retina"
		    :height 130
		    :weight 'regular
		    )
(set-face-attribute 'variable-pitch nil
 		    :family "JetBrains Mono"
		    :height 125
		    :weight 'regular)
(set-face-attribute 'fixed-pitch nil
		    :family "Fira Code"
		    :height 125
		    :weight 'regular)
(add-hook 'text-mode-hook #'variable-pitch-mode)

(provide 'init-look)
