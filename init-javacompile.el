;;; init-javacompile.el --- java-mode compile command setting -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun my-java-compile-command ()
  "Compile command setting."
  (concat "javac " (buffer-name)))

(add-hook 'java-mode-hook
          (lambda ()
            (set (make-local-variable 'compile-command) (my-java-compile-command))))


(provide 'init-javacompile)
;;; init-javacompile.el ends here
