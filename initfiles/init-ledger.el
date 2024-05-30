(use-package ledger-mode
  :ensure t
  :init  (setq ledger-clear-whole-transactions 1)
  :mode "\\.dat\\'"
  ;; :bind (:map ledger-mode-map
  ;;   ("C-a C-l" . ledger-add-entry)
  ;; :preface
  ;; (defun ledger-add-entry (title in amount out)
  ;;     (interactive
  ;;      (let ((accounts (mapcar 'list (ledger-accounts))))
  ;;        (list (read-string "Entry: " (format-time-string "%Y-%m-%d " (current-time)))
  ;;              (let ((completion-regexp-list "^Expenses:"))
  ;;                (completing-read "What did you pay for? " accounts))
  ;;              (read-string "How much did you pay? " "CHF ")
  ;;              (let ((completion-regexp-list "^Asset:"))
  ;;                (completing-read "Where did the money come from? " accounts)))))
  ;;     (insert title)
  ;;     (newline)
  ;;     (indent-to 4)
  ;;     (insert in "  " amount)
  ;;     (newline)
  ;;     (indent-to 4)
  ;;     (insert out)))
  )

(use-package flycheck-ledger
  :ensure t
  :after ledger-mode)

(provide 'init-ledger) 
