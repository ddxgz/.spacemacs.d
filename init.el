;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs-base

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
   '(lua
     csv
     rust
     spacemacs-completion
     spacemacs-layouts
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-evil
     ;; spacemacs-language
     spacemacs-misc
     spacemacs-modeline
     spacemacs-navigation
     spacemacs-org
     spacemacs-project
     ;; spacemacs-purpose
     spacemacs-visual

     pcx-org
     ;; rust
     ;; csv
     ;; restclient

     docker
     plantuml
     nginx
     yaml
     ;; If you have problem entering symbols that are behind the ⌥ key you may want to set the variables as follows. This will allow you to use the right ⌥ key to write symbols. The left ⌥ key can be used as the Meta key.
     (osx :variables osx-option-as 'meta
          osx-right-option-as 'none)
     (go :variables go-tab-width 4)
     ess
     ;; csv
     html
     javascript
     bibtex
     ;; latex
     (latex :variables
            latex-build-command "LatexMk")
     ;; latex-build-command "LaTeX")
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
     ;; ivy
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
   ;; To use a local version of a package, use the `:location' property:
   ;; '(your-package :location "~/path/to/your-package/")
   ;; Also include the dependencies as they will not be resolved automatically.
   dotspacemacs-additional-packages '(
                                      ;;by pcx;;
                                      ;; vetur
                                      lsp-mode
                                      company-lsp

                                      academic-phrases
                                      ;; beamer
                                      cdlatex
                                      ox-gfm
                                      ox-twbs
                                      ;; ox-hugo
                                      ;; beacon
                                      ;; monokai-theme
                                      doom-themes
                                      interleave
                                      yasnippet-snippets
                                      lsp-vue
                                      vue-mode
                                      ;; (vue-mode :location (recipe
                                      ;;                      :fetcher github
                                      ;;                      :repo "codefalling/vue-mode"))
                                      ;; company-quickhelp
                                      deft
                                      exec-path-from-shell
                                      darkroom
                                      pdf-tools
                                      )

   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()

   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    ;; org-projectile
                                    anaconda-mode
                                    ess-R-object-popup
                                    ;;
                                    ;; org-timer
                                    saas-mode
                                    julia-mode
                                    fancy-battery
                                    linum
                                    )

   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and deletes any unused
   ;; packages as well as their unused dependencies. `used-but-keep-unused'
   ;; installs only the used packages but won't delete unused ones. `all'
   ;; installs *all* packages supported by Spacemacs and never uninstalls them.
   ;; (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization:
This function is called at the very beginning of Spacemacs startup,
before layer configuration.
It should only modify the values of Spacemacs settings."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t

   ;; Maximum allowed time in seconds to contact an ELPA repository.
   ;; (default 5)
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives nil

   ;; If non-nil then spacemacs will check for updates at startup
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

   ;; If non-nil output loading progress in `*Messages*' buffer. (default nil)
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
   ;; `recents' `bookmarks' `projects' `agenda' `todos'.
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
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
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

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
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
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil

   ;; If non-nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil

   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t

   ;; If non-nil, `J' and `K' move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil

   ;; If non-nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil

   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"

   ;; If non-nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
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

   ;; If non-nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil

   ;; if non-nil, the helm header is hidden when there is only one source.
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

   ;; If non-nil, the paste transient-state is enabled. While enabled, pressing
   ;; `p' several times cycles through the elements in the `kill-ring'.
   ;; (default nil)
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

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
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

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
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

   ;; If non-nil `smartparens-strict-mode' will be enabled in programming modes.
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

   ;; If non-nil, start an Emacs server if one is not already running.
   dotspacemacs-enable-server t

   ;; If non-nil, advise quit functions to keep server open when quitting.
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

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
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

  (setq tramp-ssh-controlmaster-options
        "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")


  (setq-default

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; lastest version of packages from MELPA. (default nil)
   ;; dotspacemacs-use-spacelpa t

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default nil)
   dotspacemacs-verify-spacelpa-archives t

   dotspacemacs-themes '(
                         spacemacs-light
                         doom-one
                         spacemacs-dark
                         )

   dotspacemacs-mode-line-theme '(spacemacs :separator slant :separator-scale 1.2)
   ;; dotspacemacs-mode-line-unicode-symbols nil

   ;; dotspacemacs-mode-line-theme 'doom
   ;; (setq doom-modeline-buffer-file-name-style 'relative-to-project)
   ;; (setq doom-modeline-icon nil)

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
   ;; dotspacemacs-line-numbers t
   dotspacemacs-line-numbers '(:relative t
                                         :disabled-for-modes dired-mode
                                         doc-view-mode
                                         markdown-mode
                                         org-mode
                                         pdf-view-mode
                                         text-mode
                                         :size-limit-kb 1000)
   ;; dotspacemacs-line-numbers '(:relative t
   ;;                             :size-limit-kb 1000)

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

  ;; UI
  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
  ;; or 'dark, to switch to white title text
  (add-to-list 'default-frame-alist '(ns-appearance . 'nil))
  (add-to-list 'default-frame-alist '(left-fringe . 11))
  (add-to-list 'default-frame-alist '(right-fringe . 11))
  (add-to-list 'default-frame-alist '(vertical-scroll-bars. nil))
  (add-to-list 'default-frame-alist '(internal-border-width . 0))
  ;; frame size on start
  (add-to-list 'default-frame-alist '(width . 100))
  (add-to-list 'default-frame-alist '(height . 50))

  ;; for Chinese character 等宽: Source Code Pro 13 + STkaiti 16
  (setq face-font-rescale-alist `(("STKaiti" . ,(/ 16.0 13))))
  (set-fontset-font t 'han      (font-spec :family "STKaiti"))
  (set-fontset-font t 'cjk-misc (font-spec :family "STKaiti"))


  ;; ;; keybindings
  ;; In smartparens-mode
  ;;  https://ebzzry.io/en/emacs-pairs/
  ;; (define-key evil-insert-state-map (kbd "C-;") 'sp-up-sexp)
  (define-key evil-insert-state-map (kbd "C-'") 'sp-up-sexp)
  (define-key evil-insert-state-map (kbd "C-[") 'sp-beginning-of-sexp)
  (define-key evil-insert-state-map (kbd "C-]") 'sp-end-of-sexp)
  ;; sp-down-sexp
  ;; sp-backward-down-sexp
  ;; sp-backward-up-sexp

  ;; (define-key evil-insert-state-map (kbd "C-'") 'end-of-line)
  (define-key evil-insert-state-map (kbd "C-d") 'evil-delete-char)
  (define-key evil-insert-state-map (kbd "C-a") 'move-beginning-of-line) ;; was 'evil-paste-last-insertion
  (define-key evil-insert-state-map (kbd "C-e") 'end-of-line)    ;; was 'evil-copy-from-below
  (define-key evil-insert-state-map (kbd "C-n") 'next-line)      ;; was 'evil-complete-next
  (define-key evil-insert-state-map (kbd "C-p") 'previous-line)  ;; was 'evil-complete-previous


  ;; for yasnippet
  (global-set-key (kbd "C-c y") 'yas-insert-snippet)

  ;; key for helm functions
  (spacemacs/set-leader-keys "s C-l" 'spacemacs/resume-last-search-buffer)
  ;; C-c C-x prompts for an external application from the list of all applications seen by Emacs
  ;; C-c X open with default application
  (spacemacs/set-leader-keys "s l" 'helm-locate)

  ;; for upcase and downcase
  ;; to set it to only in text mode
  ;; (spacemacs/declare-prefix "]" "bracket-prefix")
  (global-set-key (kbd "C-x t U") 'upcase-region)
  (global-set-key (kbd "C-x t D") 'downcase-region)
  (global-set-key (kbd "C-x t C") 'capitalize-region)
  (global-set-key (kbd "C-x t u") 'upcase-word)
  (global-set-key (kbd "C-x t d") 'downcase-word)
  (global-set-key (kbd "C-x t c") 'capitalize-word)


  ;; load awesome-tab
  ;; (add-to-list 'load-path (expand-file-name "~/.spacemacs.d/elisp"))
  ;; (use-package awesome-tab)
  ;; (use-package awesome-tab
  ;;   :load-path "~/.spacemacs.d/elisp/awesome-tab.el"
  ;;   :config
  ;;   (awesome-tab-mode t)
  ;;   )
  ;; (awesome-tab-build-helm-source)
  ;; (add-to-list 'helm-source-list, 'helm-source-awesome-tab-group)

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
  ;; (spaceline-compile)


  ;; ;; blink cursur place
  ;; (beacon-mode 1)

  ;; ;; ;; from lujun9972
  ;; (setq scroll-margin 5
  ;;       scroll-conservatively 9999
  ;;       scroll-step 1)

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

  (use-package pdf-tools)

  ;; (use-package darkroom)

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

  ;; get system shell's env to emacs
  (use-package exec-path-from-shell
    :ensure t
    :init (progn
            ;; locale for shell
            (exec-path-from-shell-copy-env "LC_ALL")
            (exec-path-from-shell-copy-env "LANG")

            (when(not(eq system-type 'windows-nt))
              ;; (setq exec-path-from-shell-variables '("GOPATH"))
              ;; when it is nil, exec-path-from-shell will read environment variable
              ;; from .zshenv instead of .zshrc, but makes sure that you put all
              ;; environment variable you need in .zshenv rather than .zshrc
              (setq exec-path-from-shell-check-startup-files nil) ;
              (setq exec-path-from-shell-arguments '("-l" )) ;remove -i read form .zshenv
              (exec-path-from-shell-initialize)
              )
            )
    )

  ;; ;; for layers ;; ;;

  (use-package web-mode
    :defer t
    :config
    (progn
      (add-to-list 'auto-mode-alist '("\\.tmpl\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.gotmpl\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.gohtml\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
      (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
      ;; auto highlight for pasted code in web-mode
      (setq web-mode-enable-auto-indentation t)
      (add-hook 'web-mode-hook 'company-mode)
      (add-hook 'web-mode-hook 'lsp-vue-enable)
      )
    )

  ;; (setq projectile-project-search-path '(
  ;;                                        "~/Dropbox/Papers"
  ;;                                        ))

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

  ;; ;; vue mode
  ;; (defun dotspacemacs/init-vue-mode ()
  ;;   (use-package vue-mode))
  (use-package vue-mode
    :defer t
    :config
    (add-to-list 'vue-mode-hook #'smartparens-mode)
    )

  (use-package lsp-mode)
  (use-package lsp-ui
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    )

  (setq lsp-message-project-root-warning t) ;avoid popup warning buffer if lsp can't found root directory (such as edit simple *.py file)

  (use-package lsp-vue
    :config
    (progn
      (add-hook 'vue-mode-hook #'lsp-vue-mmm-enable)
      (add-hook 'vue-mode-hook 'flycheck-mode)
      (with-eval-after-load 'lsp-mode
        (use-package lsp-ui-flycheck)
        )
      )
    )

  (use-package company-lsp
    :config
    (push 'company-lsp company-backends)
    (setq company-lsp-enable-snippet t)
    )

  (use-package company
    :ensure
    :config
    (setq company-minimum-prefix-length 1)
    (setq company-dabbrev-downcase nil)
    (setq company-idle-delay 0.5)
    (setq company-idle-delay 0.5)
    ;; (add-hook 'company-mode-hook 'company-quickhelpmode)
    (add-to-list 'company-backends 'company-lsp))

  ;; (use-package company-quickhelp :ensure)

  (use-package deft
    :bind ("<f8>" . deft)
    :commands (deft)
    :config (setq deft-directory "~/Dropbox/Textnotes"
                  deft-recursive t
                  deft-extensions '("md" "org")
                  )
    )


  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
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
   '(package-selected-packages
     (quote
      (yasnippet-snippets yapfify yaml-mode xterm-color web-mode web-beautify vue-mode edit-indirect ssass-mode vue-html-mode toml-mode tagedit smeargle slim-mode shell-pop scss-mode sass-mode reveal-in-osx-finder racer pyvenv pytest pyenv-mode py-isort pug-mode prettier-js plantuml-mode pippel pipenv pip-requirements ox-twbs ox-reveal ox-gfm osx-trash osx-dictionary orgit org-ref pdf-tools key-chord org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download org-brain nginx-mode multi-term mmm-mode markdown-toc magit-svn magit-gitflow lsp-vue lsp-ui lsp-rust lsp-python lsp-javascript-typescript typescript-mode lsp-go livid-mode skewer-mode live-py-mode launchctl json-navigator hierarchy js2-refactor multiple-cursors js2-mode js-doc interleave importmagic epc concurrent deferred impatient-mode simple-httpd htmlize helm-pydoc helm-org-rifle helm-gitignore helm-git-grep helm-css-scss helm-company helm-c-yasnippet helm-bibtex parsebib haml-mode godoctor go-tag go-rename go-impl go-guru go-gen-test go-fill-struct go-eldoc gnuplot gitignore-templates gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md fuzzy flyspell-correct-helm flyspell-correct flycheck-rust flycheck-pos-tip pos-tip flycheck exec-path-from-shell evil-org evil-magit magit git-commit ghub treepy graphql with-editor ess-R-data-view ctable ess julia-mode eshell-z eshell-prompt-extras esh-help emmet-mode doom-themes dockerfile-mode docker json-mode tablist magit-popup docker-tramp json-snatcher json-reformat deft darkroom cython-mode csv-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-lua lua-mode company-lsp lsp-mode company-go go-mode company-auctex company-anaconda anaconda-mode pythonic company cdlatex cargo markdown-mode rust-mode biblio biblio-core auto-yasnippet yasnippet auto-dictionary auctex-latexmk auctex academic-phrases ht ac-ispell auto-complete ws-butler writeroom-mode winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org symon string-inflection spaceline-all-the-icons restart-emacs request rainbow-delimiters popwin persp-mode pcre2el password-generator paradox overseer org-plus-contrib org-bullets open-junk-file neotree nameless move-text macrostep lorem-ipsum link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-xref helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag golden-ratio font-lock+ flx-ido fill-column-indicator eyebrowse expand-region evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-numbers evil-nerd-commenter evil-matchit evil-lisp-state evil-lion evil-indent-plus evil-iedit-state evil-goggles evil-exchange evil-escape evil-ediff evil-cleverparens evil-args evil-anzu eval-sexp-fu elisp-slime-nav editorconfig dumb-jump dotenv-mode doom-modeline diminish counsel-projectile column-enforce-mode clean-aindent-mode centered-cursor-mode auto-highlight-symbol auto-compile aggressive-indent ace-window ace-link ace-jump-helm-line))))
  (custom-set-faces
   ;; custom-set-faces was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   )
  )
