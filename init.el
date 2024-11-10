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

;; fonts, look and theme
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

;; history or recent files
(require 'init-history)

;; completion and icons in buffer
(require 'init-completion)
(require 'init-icons)			

;; start up screen dashboard
(require 'init-startscreen)

;; eglot + envrc
(require 'init-envrc)
(require 'init-eglot)

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

;; Markdown
(require 'init-markdown)

;; Org mode
(require 'init-org)

;;;========================================
;; show all remaining key combinations when doing multi-key commands
;; https://github.com/justbur/emacs-which-key
;;;========================================
(use-package which-key
  :ensure t
  :hook (after-init . which-key-mode))

;; Store automatic customisation options elsewhere
(setq custom-file (locate-user-emacs-file "custom.el"))
(when (file-exists-p custom-file)
  (load custom-file))
