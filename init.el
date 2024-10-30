(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil)

;; Disable the menu bar
(menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; prefer utf-8
;; UTF-8 all the way
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

;; highlight the line point
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)
(add-hook 'org-mode-hook #'hl-line-mode)

;; When files change on disk, update the buffer automatically
(global-auto-revert-mode t)

;; Load path for manually installed packages
(add-to-list 'load-path "~/.config/emacs/initfiles/")

;; (setq exec-path (append '("~/.local/bin/")
;;                         exec-path))

;; look and theme
(require 'init-look)

;;;========================================
;; PACKAGE Management
;;;========================================
;; update built-in packages too. Was mainly used to fix eldoc 
(setq package-install-upgrade-built-in t)

(setq load-prefer-newer t)
(eval-and-compile
  (require 'package)
  (setq package-archives (append
			  package-archives
			  '(("melpa" . "https://melpa.org/packages/")))))

(require 'use-package)
;;install packages asynchronously
(use-package async
  :ensure t
  :config
  (setq async-bytecomp-package-mode 1))

;; completion and icons in buffer
(require 'init-completion)
(require 'init-icons)			

;; dashboard
(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents   . 5)
			  (projects  . 5) 
                          (agenda    . 5))))
;; (setq dashboard-startupify-list '(dashboard-insert-banner-title
;;                                   dashboard-insert-navigator
;;                                   '(dashboard-insert-newline 2)
;;                                   dashboard-insert-footer))
(setq dashboard-display-icons-p t)     ; display icons on both GUI and terminal
(setq dashboard-icon-type 'nerd-icons) ; use `nerd-icons' package
(setq dashboard-set-file-icons t)
;;(setq dashboard-filter-agenda-entry 'dashboard-no-filter-agenda)
(setq dashboard-match-agenda-entry "TODO=\"TODO\"")
(setq dashboard-agenda-sort-strategy '(time-up))

;; buffers
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; eglot
(require 'init-eglot)

;; Manage enviornments using direnv
;; (require 'init-envrc)

;; ledger mode
(require 'init-ledger)

;; Python mode
(require 'init-python)

;; Julia mode
(require 'init-juliamode)

;; rust mode
(require 'init-rust)

;; latex mode
(require 'init-tex)

;; Git
(require 'init-git)

;; Markdown (markdown-mode)
(require 'init-markdown)

;; org mode
(require 'init-org)

;;;========================================
;; show all remaining key combinations when doing multi-key commands
;; https://github.com/justbur/emacs-which-key
;;;========================================
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-right))

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "initfiles/custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
(put 'upcase-region 'disabled nil)
