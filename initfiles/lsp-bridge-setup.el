;;; lsp-bridge-setup.el --- -*- lexical-binding: t -*-
;;; Commentary:
;;; File created by Alessandro Maria Benassi Trenta in date 02/12/2022
;;; Loads lsp-bridge and configure it
;;; Code:


(use-package lsp-bridge
  :defer 5
  :after (yasnippet markdown-mode)
  :ensure (:type git :host github :repo "manateelazycat/lsp-bridge"
                 :files (:defaults
                         "*.el"
                         "*.py"
                         "acm"
                         "core"
                         "langserver"
                         "multiserver"
                         "resources")
                 :build (:not compile))
    :init
    (global-lsp-bridge-mode))
  ;;  :config
  ;; bind keys here because those are present
  ;; only in dvorok & xah setup
  ;; (unless block-xah
  ;;   ;; `C-u' will be on 'C-c' due translation map, see 'dvorak-translation-setup.el'
  ;;   (define-key acm-mode-map (kbd "C-u") 'acm-select-prev)
  ;;   (define-key acm-mode-map (kbd "C-t") 'acm-select-next)) ;

  ;; ;; disable tabnine: it's not open source
  ;; (setq acm-enable-tabnine nil)

  ;; ;; enable signature help in posframe
  ;; (setq lsp-bridge-enable-signature-help t)
  ;; (setq lsp-bridge-signature-help-fetch-idle 0.3)
  ;; (setq lsp-bridge-signature-show-function 'lsp-bridge-signature-show-with-frame)
  ;; (setq lsp-bridge-signature-show-with-frame-position 'point)

  ;; ;; combine lsp-bridge with orderless
  ;; (setq acm-candidate-match-function 'orderless-flex)
  ;; (setq acm-backend-lsp-candidate-min-length 1)

  ;; ;; small QoL
  ;; (setq acm-enable-quick-access t)

  ;; ;; language servers
  ;; (setq lsp-bridge-c-lsp-server "ccls")
  ;; (setq lsp-bridge-python-lsp-server "pyright")
  ;; (setq lsp-bridge-elixir-lsp-server "lexical")

;; needed for terminal, there is a visual bug
;; if loading them in graphics mode
(unless (or (display-graphic-p) (daemonp))
  (require 'popon-setup)
  (require 'acm-terminal-setup))


(provide 'lsp-bridge-setup)
;;; lsp-bridge-setup.el ends here
