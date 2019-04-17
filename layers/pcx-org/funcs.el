;; bind a key to open a frequently used file
;; the hint is the text hint show what file will be opened by the keybinding.
;; (defun pcx-set-key-open-file (key thefile hint)
;;   (global-set-key (kbd key) (funcall (lambda (efile) (interactive)(find-file (format "%s" efile))) thefile))
;;   ;; (global-set-key (kbd key) (lambda () (interactive)(find-file (format "%s" thefile))))
;;   (which-key-add-key-based-replacements key hint)
  ;; )

;; (defun switch-dark-theme ()
;;   (setq dark-theme 'spacemacs-dark)
;;   (load-theme dark-theme 1))

;; (defun switch-light-theme ()
;;   (load-theme 'spacemacs-light 1))
