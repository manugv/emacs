;;******
;; The built-in `savehist-mode' saves minibuffer histories.  Vert
;; Further reading: https://protesilaos.com/emacs/dotemacs#h:25765797-27a5-431e-8aa4-cc890a6a913a
(savehist-mode 1)

;; The built-in `recentf-mode' keeps track of recently visited files.
;; You can then access those through the `consult-buffer' interface or
;; with `recentf-open'/`recentf-open-files'.
;;
;; I do not use this facility, because the files I care about are
;; either in projects or are bookmarked.
(use-package recentf
  :config
  (setq recentf-auto-cleanup 'never) ;; prevent issues with Tramp
  (setq recentf-max-saved-items 100)
  (setq recentf-max-menu-items 15)
  (recentf-mode t)
  (defun my/recentf-ido-find-file ()
    "Find a recent file using ido."
    (interactive)
    (let ((file (completing-read "Choose recent file: " recentf-list nil t)))
      (when file
        (find-file file))))
  :bind ("C-x f" . my/recentf-ido-find-file))

(provide 'init-history)
