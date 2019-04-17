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

;; make current tree archived by tag
(org-defkey org-mode-map (kbd "C-c A") 'org-archive-to-archive-sibling)


;; global key to open tasks.org anywhere
;; (global-set-key (kbd "C-c f t") (lambda() (interactive)(find-file "~/Dropbox/Orgzly/tasks.org")))


(global-set-key (kbd "C-c f h") (lambda () (interactive)(find-file "~/Dropbox/Textnotes/handbook.org")))
(which-key-add-key-based-replacements "C-c f h" "handbook")

(global-set-key (kbd "C-c f n") (lambda () (interactive)(find-file "~/Dropbox/Textnotes/Notebook/notebook.org")))
(which-key-add-key-based-replacements "C-c f n" "notebook")

(global-set-key (kbd "C-c f u") (lambda () (interactive)(find-file "~/Dropbox/Textnotes/PhD/unread-papers.org")))
(which-key-add-key-based-replacements "C-c f u" "unread-papers")

(global-set-key (kbd "C-c f r") (lambda () (interactive)(find-file "~/Dropbox/Textnotes/PhD/research process.org")))
(which-key-add-key-based-replacements "C-c f r" "research-process")

(global-set-key (kbd "C-c f p") (lambda () (interactive)(find-file "~/Dropbox/Papers/notes-papers.org")))
(which-key-add-key-based-replacements "C-c f p" "notes-papers")

(global-set-key (kbd "C-c f c") (lambda () (interactive)(find-file "~/Dropbox/Textnotes/courses/course notes.org" )))
(which-key-add-key-based-replacements "C-c f c" "course-notes")
;; (pcx-set-key-open-file "C-c f c" "~/Dropbox/Textnotes/courses/course notes.org" "course-notes")
