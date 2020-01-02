(defconst pcx-org-packages
  '(
    org))


(defun pcx-org/post-init-org ()
  (use-package org
    ;; :defer t
    :config
    (progn
      ;; ;; Fontify the whole line for headings (with a background color).
      ;; (setq org-fontify-whole-heading-line t)

      ;; turn on golden-ratio window resizing
      ;; see: https://github.com/roman/golden-ratio.el
      ;; (golden-ratio-mode 1)

      ;; line wrap in text mode
      ;; (add-hook 'text-mode-hook 'visual-fill-column-mode)
      ;; (add-hook 'text-mode-hook 'visual-line-mode)
      ;; (add-hook 'text-mode-hook 'spacemacs/toggle-fill-column-indicator-off)

      ;; (use-package ox-extra
      ;;   :config
        ;; (ox-extras-activate '(ignore-headlines))
        ;; )


      ;; add hook to enable smartparens in org-mode
      (add-hook 'org-mode-hook #'smartparens-mode)

      ;; to enable entry list with visual line indention
      (setq org-startup-indented t)

      ;; ;; to enable auto fill-column as 80
      ;; (add-hook 'org-mode-hook '(lambda () (setq fill-column 80)))
      ;; (add-hook 'org-mode-hook 'turn-on-auto-fill)

      (add-hook 'org-mode-hook (lambda()
                                 (define-key
                                   evil-insert-state-local-map
                                   (kbd "M-RET")
                                   #'org-meta-return)))

      (setq org-export-with-smart-quotes t)

      (setq org-image-actual-width nil)

      ;; org-download screenshot method
      (setq org-download-screenshot-method "/usr/sbin/screencapture -i %s")
      ;; (setq org-download-screenshot-method "screencapture")


      ;; from https://www.reddit.com/r/emacs/comments/3pw2qq/orgmode_headings_and_blank_lines/
      ;; control blank line before new entry
      ;; This is controlled by the variable org-blank-before-new-entry.  Normally
      ;; this is set to 'auto' by default to try to make the following entry for
      ;; lists and headings the same as the current one -- if it has a blank line
      ;; then the next entry will also.
      ;;
      ;; You can customize this variable to always or never include blank lines
      ;; before new entries.
      (setq org-blank-before-new-entry
            '(
              ;; (heading . always)
              (plain-list-item . nil)
              ))


      ;; http://www.zmonster.me/2018/02/28/org-mode-capture.html

      ;; set for org-capture
      ;; (setq org-default-notes-file (concat org-directory "/capture.org"))
      ;; (setq org-default-notes-file (org-directory "/Users/pc/Dropbox/Textnotes/capture.org"))

      (setq org-capture-templates
            '(
              ;; ("a" "Appointment" entry (file  "~/Dropbox/Textnotes/gcal.org" "Appointments")
              ;;  "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
              ;; ("n" "Note" entry (file+headline "~/Dropbox/Textnotes/notes.org" "Captured Notes")
              ("n" "Note" entry (file+headline "~/Dropbox/Textnotes/handbook.org" "Captured Notes")
               "* [Note] %? \n:PROPERTIES:\n:Created: %U\n:END:\n\n\n")
              ;; ("l" "Link" entry (file+headline "~/Dropbox/Textnotes/links.org" "Links")
              ;;  "* %? %^L %^g \n%T" :prepend t)
              ;; ("b" "Blog idea" entry (file+headline "~/Dropbox/Textnotes/i.org" "Blog Topics:")
              ;;  "* %?\n%T" :prepend t)
              ("p" "Paper" entry (file+headline "~/Dropbox/Textnotes/PhD/unread-papers.org" "Papers Captured")
               "* TODO %? \n:PROPERTIES:\nCreated: %T\n:END:\n" :prepend t)
              ;; ("t" "TODO Item" entry (file+headline "~/Dropbox/Orgzly/handbook.org" "Captured TODO Items")
              ("t" "TODO Item" entry (file+headline "~/Dropbox/Textnotes/handbook.org" "Captured TODO Items")
               "* TODO %? \n:PROPERTIES:\n:Created: %T\n:END:\n\n\n")

              ("l" "LinkedInfo TODO Item" entry (file+headline "~/code/linkedinfo/TODOs.org" "Captured TODO Items")
               "*** TODO %? %^g \n:PROPERTIES:\n:Created: %U\n:END:\n\n")

              ("a"               ; key
               "Article"         ; name
               entry             ; type
               (file+headline "~/Dropbox/Textnotes/PhD/articles.org" "Article Captured")  ; target
               "* TODO %? \n:PROPERTIES:\n:Created: %U\n:Linked: %a\n:END:\n%i\n"  ; template
               ;; :prepend t        ; properties
               :empty-lines 1    ; properties
               ;; :created t        ; properties
               )

              ;; ("j" "Journal" entry (file+datetree "~/Dropbox/journal.org")
              ;;  "* %?\nEntered on %U\n  %i\n  %a")
              ;; ("s" "Screencast" entry (file "~/Dropbox/Textnotes/screencastnotes.org")
              ;;  "* %?\n%i\n")
              ))

      ;; ;; add some awesome new text objects!
      ;; (spacemacs|define-text-object "[" "brackets" "[" "]")
      ;; (spacemacs|define-text-object "(" "parentheses" "(" ")")

      ;; ;; to set done item strikethrough
      ;; (setq org-fontify-done-headline t)
      ;; (custom-set-faces
      ;;  '(org-done ((t (:foreground "PaleGreen"
      ;;                              :weight normal
      ;;                              :strike-through t))))
      ;;  '(org-headline-done
      ;;    ((((class color) (min-colors 16) (background dark))
      ;;      (:foreground "LightSalmon" :strike-through t)))))

      ;; ;; colors in spacemacs https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bthemes/colors
      ;; (setq org-todo-keyword-faces
      ;;       '(
      ;;         ;; ("TODO" . "orange")
      ;;         ("STARTED" . "yellow")
      ;;         ("MINOR" . "yellow")
      ;;         ("HALF" . "yellow")
      ;;         ("USEFUL" . "red")
      ;;         ("WAIT" . "grey")
      ;;         ("CANCELED" . (:foreground "blue" :weight bold :strike-through t))
      ;;         ;; ("DONE" . (:background "gren-bg" :weight bold :strike-through t))
      ;;         ("DONE" . (:weight bold :strike-through t))
      ;;         ;; ("DONE" . (:foreground "LightSalmon" :weight bold :strike-through t))
      ;;         ))


      ;; (setq org-todo-keywords
      ;;       '(
      ;;         (sequence "TODO" "DOIN" "|" "DONE" "CANC")
      ;;         ;; (sequence "SENT" "APPROVED" "|" "PAID")
      ;;         ))

      (setq org-todo-keyword-faces
            '(
              ;; ("DOIN" . "#E35DBF")
              ;; ("DOIN" . (:foreground "red" :weight bold))
              ("DOIN" . (:foreground "#E35DBF" :weight bold))
              ;; ("CANC" . (:foreground "white" :background "#4d4d4d" :weight bold))
              ;; ("DONE" . (:foreground "dark green" :weight bold :strike-through t))
              ("DONE" . (:foreground "#84E297" :weight bold :strike-through t))
              ("CANC" . (:foreground "grey" :weight bold :strike-through t))
              ;; ("DELEGATED" . "pink")
              ("PAUS" . (:foreground "base" :weight bold))))


      (setq org-tag-alist '((:startgroup . nil)
                            ("GTD")
                            (:grouptags)
                            ("next" . ?n) ("soon" . ?s) ("later" . ?l)
                            (:endgroup . nil)
                            ("reviewpaper" . ?r)
                            (:startgroup . nil)
                            ("work" . ?w) ("personal" . ?p)
                            (:endgroup . nil)
                            ))

    ;;;;;;;;;;;;;;;;;; text face ;;;;;;;;;;;;;;;;;;;;;
      ;; hide the slash(/abc/), asterisks(*abc*) characters for emphasized text
      ;; (setq org-hide-emphasis-markers t)
      (setq org-hide-emphasis-markers nil)

      ;; change what face is used to display bold (or any other) markup by adding a new entry to org-emphasis-alist
      ;; refer to Font section in Documentation:
      ;; https://github.com/syl20bnr/spacemacs/blob/master/doc/DOCUMENTATION.org#font
      ;; Here is a list of common font properties:
      ;; https://www.gnu.org/software/emacs/manual/html_node/emacs/Fonts.html
      ;; 'slant'
      ;;   One of 'italic', 'oblique', or 'roman'.
      ;; 'weight'
      ;;   One of 'light', 'medium', 'demibold', 'bold' or 'black'.
      ;; 'style'
      ;;    Some fonts define special styles which are a combination of slant and weight. For instance, 'Dejavu Sans' defines the 'book' style, which overrides the slant and weight properties.
      ;; 'width'
      ;;     One of 'condensed', 'normal', or 'expanded'.
      ;; 'spacing'
      ;;      One of 'monospace', 'proportional', 'dual-width', or 'charcell'.
      ;;
      ;; colors refer to:
      ;; https://github.com/syl20bnr/spacemacs/tree/master/layers/%2Bthemes/colors
      (add-to-list 'org-emphasis-alist
                   '("*" (:weight bold :foreground "#d13632")
                     ))
      (add-to-list 'org-emphasis-alist
                   ;; '("/" (:slant italic :foreground "#1d829e")
                   ;; '("/" (:slant italic :foreground "#8a2aa7")
                   '("/" (:slant italic :foreground "#458631")
                     ))
      (add-to-list 'org-emphasis-alist
                   ;; '("_" (:slant oblique :foreground "#96bf33")
                   ;; '("_" (:underline t :foreground "#d33264")
                   '("_" (:underline t :foreground "#d6a525")
                     ))

      ;; (setq org-src-fontify-natively t)
      ;; ;; Sample minted options.
      ;; (setq org-latex-minted-options '(
      ;;                                  ("frame" "lines")
      ;;                                  ("fontsize" "\\scriptsize")
      ;;                                  ("xleftmargin" "\\parindent")
      ;;                                  ("linenos" "")
      ;;                                  ))

      (setq org-publish-project-alist
            '(("org-notes"
               ;; Directory for source files in org format
               :base-directory "~/Dropbox/Textnotes/Text"
               :base-extension "org"

               ;; HTML directory
               :publishing-directory "~/Dropbox/Textnotes/Blog/Notes"
               ;; :publishing-function org-html-publish-to-html
               :publishing-function org-twbs-publish-to-html
               :recursive t
               ;; :html-preamble t
               ;; :html-postamble t
               :auto-sitemap t
               :sitemap-title "Notes"
               :sitemap-filename "index.org"

               ;; :html-link-home "./Blog/Notes/index.html"
               ;; :html-link-up "./Blog/Notes/index.html"
               )
              ("stats-notes"
               ;; Directory for source files in org format
               :base-directory "~/Dropbox/Textnotes/Statistics"
               :base-extension "org"

               ;; HTML directory
               :publishing-directory "~/Dropbox/Textnotes/Blog/stats"
               ;; :publishing-function org-html-publish-to-html
               :publishing-function org-twbs-publish-to-html
               :recursive t
               ;; :html-preamble t
               ;; :html-postamble t
               :auto-sitemap t
               :sitemap-title "Stats"
               :sitemap-filename "index.org"

               ;; :html-link-home "./Blog/Notes/index.html"
               ;; :html-link-up "./Blog/Notes/index.html"
               )
              ;; ;; where static files (images, pdfs) are stored
              ;; ("org-static"
              ;;  :base-directory "~/org/blog/org/files/"
              ;;  :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
              ;;  :publishing-directory "~/org/blog/files/"
              ;;  :recursive t
              ;;  :publishing-function org-publish-attachment
              ;;  )

              ;; ("blog" :components ("org-notes" "org-static"))))
              ("blog" :components ("org-notes" "stats-notes"))))

      (defun auto-publish-blog-hook ()
        "Auto publish blog on save"
        ;; check if saved file is part of blog
        (if (org-publish-get-project-from-filename
             (buffer-file-name (buffer-base-buffer)) 'up)
            (save-excursion (org-publish-current-file)
                            (message "auto published blog") nil)))

      ;; Enable auto-publish when a org file in blog is saved
      (add-hook 'org-mode-hook
                (lambda ()
                  (add-hook 'after-save-hook 'auto-publish-blog-hook nil nil)))


      ;; (require 'ob-plantuml)
      (use-package ob-plantuml
        :defer t
        :config
        (setq org-plantuml-jar-path
              ;; (expand-file-name "~/Dropbox/Textnotes/tools/plantuml.jar"))
              (expand-file-name "~/.spacemacs.d/plantuml.jar"))
        )

      ;; ;; (require 'ob-python)
      ;; ;; active Org-babel languages
      (use-package ob-python
        :defer t
        :config
        (org-babel-do-load-languages
         'org-babel-load-languages
         '(;; other Babel languages
           (plantuml . t)
           ;; (yaml . t)
           ;; (json . t)
           (R . t)
           (python . t)
           ))
        )

      ;; ;; ox-hugo config
      ;; (use-package ox-hugo
      ;;   :ensure t                           ;Auto-install the package from Melpa
      ;;   :after ox
      ;;   )

      ;; Use minted
      ;; (require 'org)
      ;; (require 'ox-latex)
      (use-package ox-latex
        :defer t
        :config
        ;; (add-to-list 'org-latex-packages-alist '("" "minted"))
        ;; (add-to-list 'org-latex-packages-alist '("" "listingsutf8"))

        (setq org-latex-listings 'minted
              org-latex-packages-alist '(("" "minted"))
              ;; org-latex-pdf-process
              ;; '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              ;;   "bibtex %b"
              ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
              ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
              org-latex-pdf-process
              '("xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                "bibtex %b"
                "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"
                "xelatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
        )

      ;; refer to https://github.com/tkf/org-mode/blob/master/lisp/org-latex.el
      (with-eval-after-load 'ox-latex
        (add-to-list 'org-latex-classes
                     '("awesome-cv"
                       "\\documentclass{awesome-cv}
                        [NO-DEFAULT-PACKAGES]
                        [PACKAGES]
                        [EXTRA]"
                       ))
        (add-to-list 'org-latex-classes
                     '("bth-thesis"
                       "\\documentclass{bth-thesis}
                        [NO-DEFAULT-PACKAGES]
                        [PACKAGES]
                        [EXTRA]"
                       ("\\chapter{%s}" . "\\chapter*{%s}")
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ;; ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                       ))
        (add-to-list 'org-latex-classes
                     '("mdpi"
                       "\\documentclass{Definitions/mdpi}
                        [NO-DEFAULT-PACKAGES]
                        [PACKAGES]
                        [EXTRA]"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                       ))
        (add-to-list 'org-latex-classes
                     '("sagej"
                       "\\documentclass{sagej}
                        [NO-DEFAULT-PACKAGES]
                        [PACKAGES]
                        [EXTRA]"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                       ))
        (add-to-list 'org-latex-classes
                     '("elsarticle"
                       "\\documentclass{elsarticle}
                        [NO-DEFAULT-PACKAGES]
                        [PACKAGES]
                        [EXTRA]"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                       ))
        (add-to-list 'org-latex-classes
                     '("IEEEtran"
                       "\\documentclass{IEEEtran}"
                       ("\\section{%s}" . "\\section*{%s}")
                       ("\\subsection{%s}" . "\\subsection*{%s}")
                       ("\\subsubsection{%s}" . "\\subsubsection*{%s}")
                       ("\\paragraph{%s}" . "\\paragraph*{%s}")
                       ("\\subparagraph{%s}" . "\\subparagraph*{%s}")
                       )))

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;; for org-ref ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
      ;; (require 'org-ref)
      (use-package org-ref
        :defer t
        :config
        ;; bibtex
        ;; (setq reftex-default-bibliography '("~/Dropbox/bibliography/library.bib"))

        (progn
          (setq org-ref-default-bibliography '("~/Dropbox/bibliography/library.bib")
                org-ref-pdf-directory "~/Dropbox/bibliography/pdfs/"
                org-ref-bibliography-notes "~/Dropbox/bibliography/biblio-notes.org"
                ;; org-ref-notes-directory "~/Dropbox/Textnotes/papernotes"
                )

          ;; If you use helm-bibtex as the citation key completion method you should set these variables too.

          ;; (setq bibtex-completion-bibliography '("~/Dropbox/bibliography/library.bib")
          (setq bibtex-completion-bibliography org-ref-default-bibliography
                ;;       bibtex-completion-library-path '("~/Dropbox/bibliography/pdfs", "~/Dropbox/Articles")
                ;; bibtex-completion-notes-path "~/Dropbox/bibliography/bibtex-notes.org"
                )

          ;; open pdf with system pdf viewer (works on mac)
          (setq bibtex-completion-pdf-open-function
                (lambda (fpath)
                  (start-process "open" "*open*" "open" fpath)))

          ;; ;org-ref links are designed to export to the corresponding LaTeX
          ;; (setq org-latex-pdf-process
          ;;       '("pdflatex -interaction nonstopmode -output-directory %o %f"
          ;;         "bibtex %b"
          ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"
          ;;         "pdflatex -interaction nonstopmode -output-directory %o %f"))

          ;; (setq reftex-external-file-finders
          ;;       '(("tex" . "~/Dropbox/bibliography -format=.tex %f")
          ;;         ("bib" . "~/Dropbox/bibliography -format=.bib %f")))
       ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
          )
        )


      (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

      ;; (add-hook 'text-mode-hook 'visual-line-mode)
      (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
      (add-hook 'text-mode-hook 'spacemacs/toggle-fill-column-indicator-off)

      ;; (add-hook 'org-mode-hook (lambda ()
      ;;                            (push '(?+ . ("+" . "+")) evil-surround-pairs-alist)))

      ;; ;; hook for set font face to pitch mode (non-monospace font) for text file. See custom-set-faces
      ;; (defun set-buffer-variable-pitch ()
      ;;   (interactive)
      ;;   (variable-pitch-mode t)
      ;;   (setq line-spacing 3)
      ;;   (set-face-attribute 'org-table nil :inherit 'fixed-pitch)
      ;;   (set-face-attribute 'org-code nil :inherit 'fixed-pitch)
      ;;   (set-face-attribute 'org-block nil :inherit 'fixed-pitch)
      ;;   (set-face-attribute 'org-block-background nil :inherit 'fixed-pitch)
      ;;   )

      ;; (add-hook 'org-mode-hook 'set-buffer-variable-pitch)
      ;; (add-hook 'eww-mode-hook 'set-buffer-variable-pitch)
      ;; (add-hook 'markdown-mode-hook 'set-buffer-variable-pitch)
      ;; (add-hook 'Info-mode-hook 'set-buffer-variable-pitch)

      ;; to skip spell check for certain regions
      ;; (defun endless/org-ispell ()
      ;;   ;; "Configure `ispell-skip-region-alist' for `org-mode'."
      ;;   (make-local-variable 'ispell-skip-region-alist)
      ;;   (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
      ;;   (add-to-list 'ispell-skip-region-alist '("~" "~"))
      ;;   (add-to-list 'ispell-skip-region-alist '("=" "="))
      ;;   (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))
      ;; (add-hook 'org-mode-hook #'endless/org-ispell)

      )
    )
  )
