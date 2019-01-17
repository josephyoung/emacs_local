;;; Package --- Summary
;;; Commentary:
;;; Code:
(with-eval-after-load 'flycheck
  (require 'flycheck-posframe)
  (add-hook 'flycheck-mode-hook 'flycheck-posframe-mode))

(provide 'init-flycheck-posframe)
;;; init-flycheck-posframe.el ends here
