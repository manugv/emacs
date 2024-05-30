;; Load a theme
;;; For the built-in themes which cannot use `require'.
(require-theme 'modus-themes)
;; Add all your customizations prior to loading the themes.
(setq modus-themes-bold-constructs t
      modus-themes-completions '((matches . (extrabold intense background))
                                 (selection . (semibold accented intense))
                                 (popup . (accented)))
      modus-themes-diffs 'desaturated
      modus-themes-headings '((1 . (1.2))
                              (2 . (rainbow 1.1))
                              (3 . (1))
                              (t . (monochrome)))
      modus-themes-hl-line '(nil)
      modus-themes-links '(nil)
      modus-themes-mixed-fonts nil
      modus-themes-mode-line '(borderless accented)
      modus-themes-tabs-accented t
      modus-themes-prompts '(background)
      modus-themes-region '(accented bg-only)
      modus-themes-syntax '(faint)
      modus-themes-tabs-accented nil
      )
(setq modus-themes-org-agenda
      '((header-date . (grayscale workaholic bold-today))
        (header-block . (1.4 semibold))
        (scheduled . uniform)
        (event . (italic))
        (habit . traffic-light)))

;; Load the theme of your choice.
(load-theme 'modus-operandi)
;; Optionally define a key to switch between Modus themes.  Also check
;; the user option `modus-themes-to-toggle'.
(define-key global-map (kbd "<f5>") #'modus-themes-toggle)

(provide 'init-look)
