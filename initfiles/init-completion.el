;; Taken from https://protesilaos.com/codelog/2024-02-17-emacs-modern-minibuffer-packages/

;; The `vertico' package applies a vertical layout to the minibuffer.
;; It also pops up the minibuffer eagerly so we can see the available
;; options without further interactions.  This package is very fast
;; and "just works", though it also is highly customisable in case we
;; need to modify its behaviour.
;;
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:cff33514-d3ac-4c16-a889-ea39d7346dc5
(use-package vertico
  :ensure t
  :config
  (setq vertico-cycle t)
  (setq vertico-resize nil)
  (vertico-mode 1))

;; Fido (icomplete now includes fuzzy matching for M-x and other completions)
;; (use-package icomplete
;;   :demand t
;;   :config
;;   (add-hook 'icomplete-minibuffer-setup-hook
;; 	    (lambda () (setq-local max-mini-window-height 10)))
;;   (setq-local completion-styles '(substring initials flex))
;;   (fido-vertical-mode 1)
;;   :bind (:map icomplete-fido-mode-map
;; 	      ("RET" . icomplete-fido-ret)
;; 	      ("TAB" . icomplete-force-complete)))

;; The `marginalia' package provides helpful annotations next to
;; completion candidates in the minibuffer.  The information on
;; display depends on the type of content.  If it is about files, it
;; shows file permissions and the last modified date.  If it is a
;; buffer, it shows the buffer's size, major mode, and the like.
;;
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:bd3f7a1d-a53d-4d3e-860e-25c5b35d8e7e
(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

;; The `orderless' package lets the minibuffer use an out-of-order
;; pattern matching algorithm.  It matches space-separated words or
;; regular expressions in any order.  In its simplest form, something
;; like "ins pac" matches `package-menu-mark-install' as well as
;; `package-install'.  This is a powerful tool because we no longer
;; need to remember exactly how something is named.
;;
;; Note that Emacs has lots of "completion styles" (pattern matching
;; algorithms), but let us keep things simple.
;;
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:7cc77fd0-8f98-4fc0-80be-48a758fcb6e2
(use-package orderless
  :ensure t
  :config
  (setq completion-styles '(orderless basic)))

;; The `consult' package provides lots of commands that are enhanced
;; variants of basic, built-in functionality.  One of the headline
;; features of `consult' is its preview facility, where it shows in
;; another Emacs window the context of what is currently matched in
;; the minibuffer.  Here I define key bindings for some commands you
;; may find useful.  The mnemonic for their prefix is "alternative
;; search" (as opposed to the basic C-s or C-r keys).
;;
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:22e97b4c-d88d-4deb-9ab3-f80631f9ff1d
(use-package consult
  :ensure t
  :bind (;; A recursive grep
         ("M-s M-g" . consult-grep)
         ;; Search for files names recursively
         ("M-s M-f" . consult-find)
         ;; Search through the outline (headings) of the file
         ("M-s M-o" . consult-outline)
         ;; Search the current buffer
         ("M-s M-l" . consult-line)
         ;; Switch to another buffer, or bookmarked file, or recently
         ;; opened file.
         ("M-s M-b" . consult-buffer)))

;;#####################################################################################
;;  Buffer completion
;;#####################################################################################

;;; Corfu (in-buffer completion popup)
(use-package corfu
  :ensure t
  :init  (global-corfu-mode) (corfu-popupinfo-mode)
  ;; :after orderless marginalia vertico
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-separator ?\s)
  (corfu-quit-no-match 'separator)
  (corfu-auto-prefix 2)
  ;; (corfu-auto-delay 0.0)
  (corfu-popupinfo-delay '(1.0 . 0.5))
  (corfu-scroll-margin 5)
  ;;(corfu-preview-current nil) ; Do not preview current candidate
  )
  ;; (corfu-preselect-first nil)

  ;; I also have (setq tab-always-indent 'complete) for TAB to complete
  ;; when it does not need to perform an indentation change.
  ;; :bind (:map corfu-map
  ;; 	      ("M-p" . corfu-popupinfo-scroll-down)
  ;;             ("M-n" . corfu-popupinfo-scroll-up))
  ;; :config
  ;;  ;; Sort by input history (no need to modify `corfu-sort-function').
  ;; (with-eval-after-load 'savehist
  ;;   (corfu-history-mode 1)
  ;;   (add-to-list 'savehist-additional-variables 'corfu-history)))


;; Add extensions
(use-package cape
  :ensure t
  ;; Bind dedicated completion commands
  ;; Alternative prefix keys: C-c p, M-p, M-+, ...
  :bind ("C-c p" . cape-prefix-map) ;; Alternative keys: M-p, M-+, ...
  ;; (("M-p p" . completion-at-point) ;; capf
  ;;        ("M-p t" . complete-tag)        ;; etags
  ;;        ("M-p d" . cape-dabbrev)        ;; or dabbrev-completion
  ;;        ("M-p h" . cape-history)
  ;;        ("M-p f" . cape-file)
  ;;        ("M-p k" . cape-keyword)
  ;;        ("M-p s" . cape-elisp-symbol)
  ;;        ("M-p e" . cape-elisp-block)
  ;;        ("M-p a" . cape-abbrev)
  ;;        ("M-p l" . cape-line)
  ;;        ("M-p w" . cape-dict)
  ;;        ("M-p :" . cape-emoji)
  ;;        ("M-p \\" . cape-tex)
  ;;        ("M-p _" . cape-tex)
  ;;        ("M-p ^" . cape-tex)
  ;;        ("M-p &" . cape-sgml)
  ;;        ("M-p r" . cape-rfc1345)))
  :init
  ;; Add to the global default value of `completion-at-point-functions' which is
  ;; used by `completion-at-point'.  The order of the functions matters, the
  ;; first function returning a result wins.  Note that the list of buffer-local
  ;; completion functions takes precedence over the global list.
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block)
  ;;(add-hook 'completion-at-point-functions #'cape-history)
  ;;(add-hook 'completion-at-point-functions #'cape-keyword)
  ;;(add-hook 'completion-at-point-functions #'cape-tex)
  ;;(add-hook 'completion-at-point-functions #'cape-sgml)
  ;;(add-hook 'completion-at-point-functions #'cape-rfc1345)
  ;;(add-hook 'completion-at-point-functions #'cape-abbrev)
  ;;(add-hook 'completion-at-point-functions #'cape-dict)
  ;;(add-hook 'completion-at-point-functions #'cape-elisp-symbol)
  ;;(add-hook 'completion-at-point-functions #'cape-line)
)

;; (defun ma/cape-capf-setup-textmode ()
;;   (add-to-list 'completion-at-point-functions #'cape-dict)
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev)
;;   (add-to-list 'completion-at-point-functions #'cape-file))

;; ;; (defun cape-capf-setup-text ()
;; ;;   (add-to-list 'completion-at-point-functions ( #'company-shell)))

;; (defun text-specific-corfu-mode ()
;;   "Meant to be hooked onto `text-mode', enable `corfu-mode' without
;; auto-completion."
;;   (setq-local corfu-auto t
;; 	      corfu-auto-prefix 3
;; 	      completion-cycle-threshold 3)
;;   (add-to-list 'completion-at-point-functions #'cape-dict)
;;   (add-to-list 'completion-at-point-functions #'cape-dabbrev))

;; (add-hook 'text-mode-hook #'text-specific-corfu-mode)

(provide 'init-completion)
