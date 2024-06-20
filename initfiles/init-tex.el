;;--------------------------------------------------------------------
;; REFTEX Settings
(require 'reftex)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t
      reftex-enable-partial-scans t
      reftex-save-parse-info t
      reftex-use-multiple-selection-buffers t
      reftex-toc-split-windows-horizontally t                       ; *toc*buffer on left。
      reftex-toc-split-windows-fraction 0.2)                         ; *toc*buffer ratio。 
;; (autoload 'reftex-mode "reftex" "RefTeX Minor Mode" t)
;; (autoload 'turn-on-reftex "reftex" "RefTeX Minor Mode" nil)
;; (autoload 'reftex-citation "reftex-cite" "Make citation" nil)
;; (autoload 'reftex-index-phrase-mode "reftex-index" "Phrase mode" t)

;;--------------------------------------------------------------------

(use-package tex
  :ensure auctex
  :mode ("\\.tex\\'" . latex-mode)
  :config
  (setq TeX-auto-save t
	TeX-save-query nil
	TeX-parse-self t
	TeX-show-compilation nil
	font-latex-fontify-script t)
  (setq-default TeX-master nil
		TeX-PDF-mode t)
  :hook (LaTeX-mode . (lambda ()
			(reftex-mode t)
			(flyspell-mode t)
			(LaTeX-math-mode t)
			(visual-line-mode t)
			(turn-on-auto-fill)             ; LaTeX mode，turn off auto fold)
			(auto-fill-mode 1)
			;;(define-key LaTeX-mode-map (kbd "TAB") 'TeX-complete-symbol)
			)
		    )
  )


(provide 'init-tex)

