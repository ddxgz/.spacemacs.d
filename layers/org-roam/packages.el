(defconst org-roam-packages
  '(org-roam))

(defun org-roam/init-org-roam ()
  (use-package org-roam
    :hook
    (after-init . org-roam-mode)
    :custom
    (org-roam-directory "~/Dropbox/Textnotes/")
    (org-roam-index-file "~/Dropbox/Textnotes/org-roam/index.org")
    ;; (org-roam-link-title-format "[[%s]]")
    (org-roam-tag-sources '(prop last-directory))
    (org-roam-capture-templates '(("d" "default" plain (function org-roam--capture-get-point)
                                 "%?"
                                 :file-name "org-roam/%<%Y%m%d%H%M%S>-${slug}"
                                 :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags:\n"
                                 :unnarrowed t)))
    (org-roam-ref-capture-templates
          '(("r" "ref" plain (function org-roam-capture--get-point)
             "%?"
             :file-name "webpages/${slug}"
             :head "#+ROAM_KEY: ${ref}
    #+TITLE: ${title}

    - source :: ${ref}"
             :unnarrowed t)))

    :bind (:map org-roam-mode-map
                (("C-c n l" . org-roam)
                 ("C-c n f" . org-roam-find-file)
                 ("C-c n j" . org-roam-jump-to-index)
                 ("C-c n b" . org-roam-switch-to-buffer)
                 ("C-c n g" . org-roam-graph))
                :map org-mode-map
                (("C-c n i" . org-roam-insert)))
    :init
    (progn
      (spacemacs/declare-prefix "ar" "org-roam")
      (spacemacs/set-leader-keys
        "arl" 'org-roam
        "art" 'org-roam-dailies-today
        "arf" 'org-roam-find-file
        "arg" 'org-roam-graph)

      (spacemacs/declare-prefix-for-mode 'org-mode "mr" "org-roam")
      (spacemacs/set-leader-keys-for-major-mode 'org-mode
        "rl" 'org-roam
        "rt" 'org-roam-dailies-today
        "rb" 'org-roam-switch-to-buffer
        "rf" 'org-roam-find-file
        "ri" 'org-roam-insert
        "rg" 'org-roam-graph)

      )))
