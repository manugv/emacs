(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message t
      inhibit-startup-message t
      initial-scratch-message nil)

;; Disable the menu bar
;; (menu-bar-mode -1)

;; Disable the tool bar
(tool-bar-mode -1)

;; Disable the scroll bars
(scroll-bar-mode -1)

;; enable smooth scrolling
(pixel-scroll-precision-mode 1)

;; prefer utf-8
;; UTF-8 all the way
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-language-environment 'utf-8)

;; When files change on disk, update the buffer automatically
(global-auto-revert-mode t)

;; Load path for manually installed packages
(add-to-list 'load-path "~/.config/emacs/initfiles/")

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

;; eglot
(require 'init-eglot)

;; Manage enviornments using direnv
;; install direnv on desktop
(use-package envrc
  :ensure t
  :hook (prog-mode . envrc-mode))

;; ledger mode
(require 'init-ledger)

;; ;; Python mode
(require 'init-python)

;; ;; Julia mode
(require 'init-juliamode)

;; ;; rust mode
(require 'init-rust)


;; ;; latex mode
(require 'init-tex)

;; Git
(use-package magit
  :ensure t
  :config
  :bind (("C-x g" . magit-status)
         ("C-c M-g" . magit-file-popup)))

;;; Markdown (markdown-mode)
(use-package markdown-mode
  :ensure t
  :defer t
  :config
  (setq markdown-fontify-code-blocks-natively t))


(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (julia . t)
   (latex . t)
   (shell . t)
   ))

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
