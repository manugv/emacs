(use-package rust-mode
  :ensure t
  :init (setq rust-mode-treesitter-derive t)
  )

(use-package cargo
  :ensure t)  
(add-hook 'rust-mode-hook 'cargo-minor-mode)

(use-package rust-ts-mode
  :ensure t
  :mode ("\\.rs\\'" . rust-ts-mode)
  :after (eglot)
  :hook ((rust-ts-mode . eglot-ensure))
  :config
  ;; add language servers
  (add-to-list 'eglot-server-programs  '((rust-ts-mode rust-mode) .
		 ("rust-analyzer" :initializationOptions (:check (:command "clippy"))))))

;; ;; corfu mode automatic
;; (defun rust-specific-corfu-mode ()
;;   "Meant to be hooked onto `text-mode', enable `corfu-mode' without
;; auto-completion."
;;   (setq-local corfu-auto t
;; 	      corfu-auto-prefix 3
;; 	      completion-cycle-threshold 3))

;; (add-hook 'rust-mode-hook #'rust-specific-corfu-mode)


;; rust run the code
(with-eval-after-load 'rust-mode
  (define-key rust-mode-map (kbd "C-r") 'my-cargo-run))

(defun my-cargo-run ()
  "Build and run Rust code."
  (interactive)
  (cargo-process-run)
  (let (
	;;(orig-win (selected-window))
	(run-win (display-buffer (get-buffer "*Cargo Run*") nil 'visible))
	)
    (select-window run-win)
    (comint-mode)
    (read-only-mode 0)
    (select-window run-win)
    ))

(provide 'init-rust)
