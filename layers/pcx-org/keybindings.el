;; (org-defkey org-mode-map (kbd "<C-c> <C-;>") (kbd "<C-c> <C-p> TAB"))
;; (org-defkey org-mode-map [(control ";")] [(control c) (control p) (tab)])

;; ;; may delete after update, to map meta-return
;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)
;; (org-defkey evil-insert-state-local-map (kbd "M-RET") 'org-meta-return)

;; insert ref link
;; (org-defkey org-mode-map (kbd "<C-c> <C-i> c") 'org-ref-insert-link)
(org-defkey org-mode-map (kbd "C-c r") 'org-ref-insert-link)

;; interleave
(org-defkey org-mode-map (kbd "C-c i") 'interleave-mode)

;; global key to open tasks.org anywhere
(global-set-key (kbd "C-c f t") (lambda() (interactive)(find-file "~/Dropbox/Orgzly/tasks.org")))

(global-set-key (kbd "C-c f n") (lambda() (interactive)(find-file "~/Dropbox/Textnotes/Notebook/notebook.org")))

(global-set-key (kbd "C-c f u") (lambda() (interactive)(find-file "~/Dropbox/Textnotes/PhD/unread-papers.org")))
