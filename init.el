;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     csv
     ;; restclient

     plantuml
     nginx
     yaml
     osx
     go
     ess
     ;; csv
     html
     javascript
     bibtex
     ;; latex
     (latex :variables
            latex-build-command "LatexMk")
     ;; config for python layer
     lsp
     ;; python
     (python :variables
             python-backend 'lsp
             ;; python-backend 'anaconda
             python-fill-column 80
             python-sort-imports-on-save nil)

     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     (auto-completion :variables
                      ;; can use C-l for completing selection
                      auto-completion-return-key-behavior nil
                      ;; auto-completion-tab-key-behavior 'complete
                      ;; auto-completion-complete-with-key-sequence nil
                      ;; auto-completion-complete-with-key-sequence-delay 0.1
                      auto-completion-enable-snippets-in-popup t)
     ;; better-defaults
     emacs-lisp
     neotree
     git
     markdown
     ;; org
     (org :variables
          ;; export github flavored markdown
          org-enable-github-support t
          ;; export Twitter Boostrap
          org-enable-bootstrap-support t
          ;; reveal.js 
          org-enable-reveal-js-support t)

     (shell :variables
            shell-default-height 20
            shell-default-position 'bottom)
     spell-checking
     syntax-checking
     ;; version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(
                                      ;;by pcx;;
                                      ;; beamer
                                      cdlatex
                                      ox-gfm
                                      ox-twbs
                                      ;; beacon
                                      monokai-theme
                                      ;;interleave
                                      yasnippet-snippets
                                      (vue-mode :location (recipe
                                                           :fetcher github
                                                           :repo "codefalling/vue-mode"))
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '(
                                  ;; anaconda-mode
                                  )
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; org-projectile
                                    ;; anaconda-mode
                                    ess-R-object-popup
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; lastest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil

   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'. (default 'emacs-version)
   dotspacemacs-elpa-subdirectory 'emacs-version

   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
      ;; Set the theme for the Spaceline. Supported themes are `spacemacs',
   ;; `all-the-icons', `custom', `vim-powerline' and `vanilla'. The first three
   ;; are spaceline themes. `vanilla' is default Emacs mode-line. `custom' is a
   ;; user defined themes, refer to the DOCUMENTATION.org for more info on how
   ;; to create your own spaceline theme. Value can be a symbol or list with\
   ;; additional properties.
   ;; (default '(spacemacs :separator wave :separator-scale 1.5))
   dotspacemacs-mode-line-theme '(spacemacs :separator wave :separator-scale 1.5)

   ;; If non-nil the cursor color matches the state color in GUI Emacs.
   ;; (default t)
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 13
                               :weight normal
                               :width normal)

   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; ;; The default package repository used if no explicit repository has been
   ;; ;; specified with an installed package.
   ;; ;; Not used for now. (default nil)
   ;; dotspacemacs-default-package-repository nil

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   
   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first."


  ;; ;; this two lines are to temporary fix the issue "startup issue - use-package & ace-jump-buffer"
  ;; (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  ;; (push '(use-package . "melpa-stable") package-pinned-packages)

  (setq-default

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; lastest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives t

   dotspacemacs-mode-line-theme '(spacemacs :separator slant :separator-scale 1.2)
   ;; dotspacemacs-mode-line-unicode-symbols nil

   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   ;; dotspacemacs-line-numbers nil
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; (default nil)

   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   ;; Note: By default, Spacemacs will automatically save the layouts under the name persp-auto-save.
   ;; Setting the variable dotspacemacs-auto-resume-layouts to t will automatically resume the last saved layouts.
   dotspacemacs-auto-resume-layouts t
   )

  ;; latex
  ;; for using xelatex to latex layer
  ;; "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"

  ;; org-latex-pdf-process
  ;; '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
  ;;   "bibtex %b"
  ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
  ;;   "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  ;; (add-hook 'LaTeX-mode-hook
  ;;           (lambda ()
  ;;             (add-to-list 'TeX-command-list '("XeLaTeX" "%`xelatex --synctex=1%(mode)%' %t" TeX-run-TeX nil t))))

  )

(defun dotspacemacs/user-config ()
  "Configuration for user code:
This function is called at the very end of Spacemacs startup, after layer
configuration.
Put your configuration code here, except for variables that should be set
before packages are loaded."

  ;; ;; By pcx ;; ;;

  ;; for Chinese character 等宽: Source Code Pro 13 + STkaiti 16
  (setq face-font-rescale-alist `(("STKaiti" . ,(/ 16.0 13))))
  (set-fontset-font t 'han      (font-spec :family "STKaiti"))
  (set-fontset-font t 'cjk-misc (font-spec :family "STKaiti"))


  ;; ;; my keybindings
  ;; In smartparens-mode, the function sp-up-sexp will move you out of a set of parentheses (bind to your key of choice)
  (define-key evil-insert-state-map (kbd "C-'") 'sp-up-sexp)
  ;; sp-beginning-of-sexp
  ;; sp-end-of-sexp
  ;; sp-down-sexp
  ;; sp-backward-down-sexp
  ;; sp-backward-up-sexp

  ;; ;; for vim
  ;; ;; set escape keybinding to "jk"
  ;; (setq-default evil-escape-key-sequence "jk")

  ;; ;; navigating using visual lines, even if they are line wrapped
  ;; (define-key evil-normal-state-map
  ;;   (kbd "j") 'evil-next-visual-line)
  ;; (define-key evil-normal-state-map
  ;;   (kbd "k") 'evil-previous-visual-line)


  ;; may delete after update, to fix load layouts problem
  ;; (require 'helm-bookmark)

  ;; (desktop-save-mode)
  ;; (desktop-read)

  ;; deprecated in 0.300
  ;; ;; for spacemacs config
  ;; for letting powerline looks smooth in macos
  ;; (setq powerline-default-separator 'utf-8)
  ;; (setq powerline-default-separator 'slant)
  (spaceline-compile)


  ;; ;; blink cursur place
  ;; (beacon-mode 1)

  ;; from lujun9972
  (setq scroll-margin 5
        scroll-conservatively 9999
        scroll-step 1)

  ;; ;; ;;; scroll one line at a time (less "jumpy" than defaults)
  ;; (setq mouse-wheel-scroll-amount '(2 ((shift) . 1))) ;; two lines at a time
  ;; (setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
  ;; (setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

  ;; (setq scroll-conservatively 1000)
  ;; another setting
  ;; (setq scroll-conservatively 101) ;; move minimum when cursor exits view, instead of recentering
  ;; (setq mouse-wheel-scroll-amount '(1)) ;; mouse scroll moves 1 line at a time, instead of 5 lines
  ;; (setq mouse-wheel-progressive-speed nil) ;; on a long mouse scroll keep scrolling by 1 line

  ;; (use-package smooth-scroll
  ;;   :config
  ;;   (smooth-scroll-mode 1)
  ;;   (setq smooth-scroll/vscroll-step-size 5)
  ;;   )

  ;; temporary solve the recentf lock problem by tell each emacs instance to write its recent file info to process-specific file
  ;; (setq recentf-sava-file (format "/tmp/recentf.%s" (emacs-pid)))


  ;; (with-eval-after-load 'helm
  ;;   (setq helm-display-function 'helm-default-display-buffer))

  ;; for set flycheck to only check when save
  ;; (with-eval-after-load 'flycheck
  (use-package flycheck
    :config
    (setq flycheck-check-syntax-automatically '(save mode-enabled))
    )

  ;; ;; (flyspell nil)
  ;; (setq flyspell-issue-message-flag nil)


  ;; (use-package magit
  ;;   :defer t)

  ;; (use-package sass-mode
  ;;   :defer t)
  ;; (use-package julia-mode
  ;;   :defer t)

  ;; ;; for layers ;; ;;
  ;; ;; for enable web-mode in default fot .tmpl
  ;; (require 'web-mode)
  ;; (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
  ;; ;; auto highlight for pasted code in web-mode
  ;; (setq web-mode-enable-auto-indentation t)
  (use-package web-mode
    :defer t
    :config
    (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
    ;; auto highlight for pasted code in web-mode
    (setq web-mode-enable-auto-indentation t)
    )

  ;; (with-eval-after-load 'python
  ;; (use-package python
  ;;   :config
  ;;   (setq py-smart-indentation t)
  ;;   ;; try to automagically figure out indentation

  ;;   (add-to-list 'python-shell-extra-pythonpaths "/usr/local/lib/python3.6/site-packages")

  ;;   ;; (setq python-shell-interpreter "python3")
  ;;   ;; (require 'python)
  ;;   ;; ;; (add-to-list 'python-shell-extra-pythonpaths "/System/Library/Frameworks/Python.framework/Versions/2.7/lib/python2.7")
  ;;   ;; ;; (add-to-list 'python-shell-extra-pythonpaths "/usr/local/lib/python2.7/site-packages")
  ;;   ;; (add-to-list 'python-shell-extra-pythonpaths "/usr/local/lib/python3.6/site-packages")

  ;;   ;; (use-package python
  ;;   ;;   :defer t
  ;;   ;;   :config
  ;;   ;;   (add-to-list 'python-shell-extra-pythonpaths "/usr/local/lib/python3.6/site-packages")
  ;;   ;;   )

  ;;   ;; ;; use IPython
  ;;   (setq-default py-shell-name "ipython")
  ;;   ;; (setq-default py-which-bufname "IPython")
  ;;   ;; use the wx backend, for both mayavi and matplotlib
  ;;   (setq py-python-command-args
  ;;         '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
  ;;   (setq py-force-py-shell-name-p t)

  ;;   ;; ;; switch to the interpreter after executing code
  ;;   ;; (setq py-shell-switch-buffers-on-execute-p t)
  ;;   ;; (setq py-switch-buffers-on-execute-p t)
  ;;   ;; ;; don't split windows
  ;;   ;; (setq py-split-windows-on-execute-p nil)
  ;;   )

  ;; ;; for org ;; ;;
  ;; ;; Fontify the whole line for headings (with a background color).
  ;; (setq org-fontify-whole-heading-line t)
  ;; (with-eval-after-load 'org
  (use-package org
    ;; :defer t
    :config
    ;; turn on golden-ratio window resizing
    ;; see: https://github.com/roman/golden-ratio.el
    ;; (golden-ratio-mode 1)

    ;; line wrap in text mode
    ;; (add-hook 'text-mode-hook 'visual-fill-column-mode)
    ;; (add-hook 'text-mode-hook 'visual-line-mode)
    ;; (add-hook 'text-mode-hook 'spacemacs/toggle-fill-column-indicator-off)

    ;; ;; may delete after update, to map meta-return
    ;; (org-defkey org-mode-map [(meta return)] 'org-meta-return)

    (setq org-export-with-smart-quotes t)

    (setq org-image-actual-width nil)

    ;; org-download screenshot method
    (setq org-download-screenshot-method "/usr/sbin/screencapture -i %s")
    ;; (setq org-download-screenshot-method "screencapture")

    ;; set for org-capture
    ;; (setq org-default-notes-file (concat org-directory "/capture.org"))
    ;; (setq org-default-notes-file (org-directory "/Users/pc/Dropbox/Textnotes/capture.org"))

    (setq org-capture-templates
          '(
            ;; ("a" "Appointment" entry (file  "~/Dropbox/Textnotes/gcal.org" "Appointments")
            ;;  "* TODO %?\n:PROPERTIES:\n\n:END:\nDEADLINE: %^T \n %i\n")
            ("n" "Note" entry (file+headline "~/Dropbox/Textnotes/notes.org" "Captured Notes")
             "* Note %?\nCreated: %T")
            ;; ("l" "Link" entry (file+headline "~/Dropbox/Textnotes/links.org" "Links")
            ;;  "* %? %^L %^g \n%T" :prepend t)
            ;; ("b" "Blog idea" entry (file+headline "~/Dropbox/Textnotes/i.org" "Blog Topics:")
            ;;  "* %?\n%T" :prepend t)
            ("p" "Paper" entry (file+headline "~/Dropbox/Textnotes/PhD/unread-papers.org" "Papers Captured")
             "* TODO %? \n:PROPERTIES:\nCreated: %T\n:END:\n" :prepend t)
            ("t" "TODO Item" entry (file+headline "~/Dropbox/Orgzly/tasks.org" "Captured TODO Items")
             "* TODO %? \n:PROPERTIES:\n:Created: %U\n:END:\n\n\n")

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

    (setq org-tag-alist '((:startgroup . nil)
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
    ;; (setq org-hide-emphasis-markers nil)

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
                 '("/" (:slant italic :foreground "#1d829e")
                   ))
    (add-to-list 'org-emphasis-alist
                 '("_" (:slant oblique :foreground "#96bf33")
                   ))

    ;; (setq org-src-fontify-natively t)
    ;; ;; Sample minted options.
    ;; (setq org-latex-minted-options '(
    ;;                                  ("frame" "lines")
    ;;                                  ("fontsize" "\\scriptsize")
    ;;                                  ("xleftmargin" "\\parindent")
    ;;                                  ("linenos" "")
    ;;                                  ))

    )


  ;; (require 'ob-plantuml)
  (use-package ob-plantuml
    :defer t
    :config
    (setq org-plantuml-jar-path
          (expand-file-name "~/Dropbox/Textnotes/tools/plantuml.jar"))
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
          org-latex-pdf-process
          '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "bibtex %b"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
            "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))
    )

  ;;;;;;;;;;;;;;;;;;;;;;;;;;;; for org-ref ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  ;; (require 'org-ref)
  (use-package org-ref
    :defer t
    :config
    ;; bibtex
    ;; (setq reftex-default-bibliography '("~/Dropbox/bibliography/library.bib"))

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


  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)

  ;; (add-hook 'text-mode-hook 'visual-line-mode)
  (add-hook 'text-mode-hook 'spacemacs/toggle-visual-line-navigation-on)
  (add-hook 'text-mode-hook 'spacemacs/toggle-fill-column-indicator-off)

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
  (defun endless/org-ispell ()
    ;; "Configure `ispell-skip-region-alist' for `org-mode'."
    (make-local-variable 'ispell-skip-region-alist)
    (add-to-list 'ispell-skip-region-alist '(org-property-drawer-re))
    (add-to-list 'ispell-skip-region-alist '("~" "~"))
    (add-to-list 'ispell-skip-region-alist '("=" "="))
    (add-to-list 'ispell-skip-region-alist '("^#\\+BEGIN_SRC" . "^#\\+END_SRC")))
  (add-hook 'org-mode-hook #'endless/org-ispell)

  ;; locale for shell
  (exec-path-from-shell-copy-env "LC_ALL")
  (exec-path-from-shell-copy-env "LANG")



  ;; (require 'vue-mode)
  ;; ;; vue mode
  ;; (defun dotspacemacs/init-vue-mode ()
  ;;   (use-package vue-mode))
  (use-package vue-mode
    :defer t
    )


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/Orgzly/tasks.org" "~/Dropbox/Textnotes/PhD/research process.org" "~/Dropbox/Textnotes/PhD/paper ideas.org")))
 '(package-selected-packages
   (quote
    (ox-reveal ac-anaconda org-mime yasnippet-snippets ghub let-alist cdlatex auto-complete-auctex auctex-lua ess-smart-equals ess-R-data-view ctable ess julia-mode plantuml-mode edit-indirect restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well nginx-mode vue-mode ssass-mode vue-html-mode yaml-mode company-auctex auctex-latexmk auctex org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib biblio biblio-core yapfify xterm-color web-mode web-beautify tagedit smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download multi-term monokai-theme mmm-mode markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help emmet-mode diff-hl cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-anaconda company coffee-mode beacon seq auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:height 160 :family "Helvetica Neue")))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(org-agenda-files
   (quote
    ("~/Dropbox/Orgzly/tasks.org" "~/Dropbox/Textnotes/PhD/research process.org" "~/Dropbox/Textnotes/PhD/paper ideas.org")))
 '(package-selected-packages
   (quote
    (lsp-mode ox-reveal ac-anaconda org-mime yasnippet-snippets ghub let-alist cdlatex auto-complete-auctex auctex-lua ess-smart-equals ess-R-data-view ctable ess julia-mode plantuml-mode edit-indirect restclient-helm ob-restclient ob-http company-restclient restclient know-your-http-well nginx-mode vue-mode ssass-mode vue-html-mode yaml-mode company-auctex auctex-latexmk auctex org-ref pdf-tools key-chord ivy tablist helm-bibtex parsebib biblio biblio-core yapfify xterm-color web-mode web-beautify tagedit smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements pbcopy ox-twbs ox-gfm osx-trash osx-dictionary orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download multi-term monokai-theme mmm-mode markdown-toc markdown-mode magit-gitflow livid-mode skewer-mode simple-httpd live-py-mode less-css-mode launchctl json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc hy-mode htmlize helm-pydoc helm-gitignore helm-css-scss helm-company helm-c-yasnippet haml-mode go-guru go-eldoc gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-pos-tip pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-z eshell-prompt-extras esh-help emmet-mode diff-hl cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-go go-mode company-anaconda company coffee-mode beacon seq auto-yasnippet yasnippet auto-dictionary anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(variable-pitch ((t (:height 160 :family "Helvetica Neue")))))
)
