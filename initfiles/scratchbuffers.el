;; (setq display-buffer-alist
;;       '(
;; 	;; Entry
;; 	;; (BUFFER-MATCHER
;; 	;;  List-of-display-functions
;; 	;;  & optional PARAMETERS)

;; 	))


;; (setq mode-line-format nil)
;; (kill-local-variable 'mode-line-format)
;; (force-mode-line-update)
;; (setq-default mode-line-format
;; 	      '("%e"
;; 		my-modeline-buffer-name
;; 		"   "
;; 		my-modeline-major-mode
;; 		))

;; (defun my-modeline--buffer-name ()
;;   "Return `buffer-name' with spaces around it."
;;   (format " %s " (buffer-name)))

;; (defvar-local my-modeline-buffer-name
;;     '(:eval
;;       (when (mode-line-window-selected-p)
;;         (propertize (my-modeline--buffer-name) 'face 'warning)))
;;   "Mode line construct to display the buffer name.")

;; ;; (defvar-local my-modeline-buffer-name
;; ;;     '(:eval
;; ;;       (when (mode-line-window-selected-pw)
;; ;; 	(propertize (buffer-name) 'face 'warning))
;; ;;   "Mode line construct to display for the buffer name.")
;; (put 'my-modeline-buffer-name 'risky-local-variable t)

;; (defvar-local my-modeline-major-mode
;;     '(:eval
;;       (propertize (capitalize (symbol-name major-mode)) 'face 'bold))
;;   "Mode line construct to display the major mode.")
;; (put 'my-modeline-major-mode 'risky-local-variable t)

;; (mode-line-window-selected-p)

;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

;; (setq doom-modeline-project-detection 'project)
