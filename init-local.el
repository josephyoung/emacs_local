;;; package --- Summary:
;;; commentary:
;;; code:

(setq user-full-name "Joseph Young")
(setq user-mail-address "2t@live.com")

(menu-bar-mode 1)
(setq visible-bell 0)
;;; scroll at 3 rows left
(setq scroll-margin 3
      scroll-conservatively 10000)

;;; matching paren
(global-set-key (kbd "#") 'match-paren)
(defun match-paren (arg)
  "Go to the matching paren if on a paren; otherwise insert %.  ARG."
  (interactive "p")
  (cond ((looking-at "\\s\(") (forward-list 1) (backward-char 1))
        ((looking-at "\\s\)") (forward-char 1) (backward-list 1))
        (t (self-insert-command (or arg 1)))))


;;; hippie-expand
(global-set-key (kbd "M-[") 'hippie-expand)
(setq hippie-expand-try-functions-list
      '(try-expand-dabbrev
        try-expand-dabbrev-visible
        try-expand-dabbrev-all-buffers
        try-expand-dabbrev-from-kill
        try-complete-file-name-partially
        try-complete-file-name
        try-expand-all-abbrevs
        try-expand-list
        try-expand-line
        try-complete-lisp-symbol-partially
        try-complete-lisp-symbol))

;; ;;remember mode setup
;; (autoload 'remember "remember" nil t)
(define-key global-map [f12] 'remember)
;; (setq remember-data-file "C:/Users/Joseph/OneDrive/Documents/notes.org")
;; (global-set-key (kbd "C-<f12>") 'my-remmeber-file)
;; (defun my-remmeber-file()
;;   (interactive)
;;   (find-file "~/Dropbox/Documents/notes.org"))

;;; yasnippet global mode
(yas-global-mode 1)
;;; pyim config
(require 'init-pyim)

;;; flycheck-clangcheck
(require 'flycheck-clangcheck)
(defun my-select-clangcheck-for-checker ()
  "Select clang-check for flycheck's checker."
  (flycheck-set-checker-executable 'c/c++-clangcheck
                                   "C:/Program Files/LLVM/bin/clang-check.exe")
  (flycheck-select-checker 'c/c++-clangcheck))

(add-hook 'c-mode-hook #'my-select-clangcheck-for-checker)
(add-hook 'c++-mode-hook #'my-select-clangcheck-for-checker)

;; enable static analysis
;; (setq flycheck-clangcheck-analyze t)

;;; magit coding-system-error cp65001 fix
;; (defun magit-fix-coding()
;;   "Magit coding-system-error cp65001 fix."
;;   (interactive)
(unless (cl-member 'cp65001 coding-system-list)
  (define-coding-system-alias 'cp65001 'utf-8))
;; (global-set-key (kbd "<f8>") 'magit-fix-coding)


;;; java compile command
(require 'init-javacompile)

;;; flycheck-posframe-mode
(require 'init-flycheck-posframe)

(provide 'init-local)
;;; init-local ends here
